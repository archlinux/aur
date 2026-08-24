pkgname=laurel-audit
pkgver=0.8.2
pkgrel=1
pkgdesc='Transform Linux Audit logs for SIEM usage'
arch=('x86_64' 'aarch64')
url='https://github.com/threathunters-io/laurel'
license=('GPL-3.0')
depends=('acl' 'audit')
makedepends=('cargo' 'clang')
conflicts=('laurel-audit-bin' 'laurel-audit-git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9cacc0d7097a0e8e7c7eccfe6fcc7fd7958e3b403ed8270a8691ad68299dec23')

build() {
  cd "laurel-${pkgver}"

  cargo build --release --locked
}

check() {
  cd "laurel-${pkgver}"

  cargo test --locked
}

package() {
  cd "laurel-${pkgver}"

  install -Dm755 "target/release/laurel" \
    "${pkgdir}/usr/bin/laurel"

  install -Dm644 "LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "etc/laurel/config.toml" \
    "${pkgdir}/usr/share/doc/${pkgname}/config.toml.example"

  install -Dm644 "etc/audit/plugins.d/laurel.conf" \
    "${pkgdir}/usr/share/doc/${pkgname}/laurel.conf.example"

  install -Dm644 "man/laurel.8.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/laurel.8.md"

  install -Dm644 "man/laurel-about.7.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/laurel-about.7.md"

  install -Dm644 "man/laurel-audit-rules.7.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/laurel-audit-rules.7.md"

  install -Dm644 "INSTALL.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/INSTALL.md"

  install -Dm644 "README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "performance.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/performance.md"
}
