# Maintainer: t4k1t <t4k1t plus aur at protonmail dot com>

pkgname=battered
pkgver=0.9.2
pkgrel=1
pkgdesc="Regularly polls battery levels and reacts to crossing configurable thresholds."
arch=('x86_64')
url="https://github.com/t4k1t/battered"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/t4k1t/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('aedc7b92b29e855bb19d496312897ff52a913abcfc6a7333e0617c02fea6a2987e46ee79346e71559957407fbd645324c549b91c9b83782ea4291554e9222f6e')
options=(!lto)

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/battered" "${pkgdir}/usr/bin/battered"

  # Documentation
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "docs/man/${pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
  install -Dm644 "docs/man/${pkgname}.5.gz" "${pkgdir}/usr/share/man/man5/${pkgname}.5.gz"

  # systemd unit
  install -Dm644 "examples/battered.service" "${pkgdir}/usr/lib/systemd/user/battered.service"
}
