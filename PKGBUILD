# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>

pkgname=cargo-local-registry
pkgver=0.2.0
pkgrel=2
pkgdesc="A cargo subcommand to manage local registries"
url="https://github.com/alexcrichton/cargo-local-registry"
depends=('cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('MIT' 'APACHE')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/alexcrichton/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('3df5023e69524da38b91cdb91b792613f835e8e0d19f3a09a28c52c5d026036b0aecb38a1c36e48f658666463eef967b94a4d916b7b3ce6a5fa7f0f1a458a48d')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release --locked
}

check() {
  cd "${pkgname}-${pkgver}"
  cargo test --release --locked
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
