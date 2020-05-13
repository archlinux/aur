# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Tony Crisci <tony@dubstepdish.com>

pkgname=i3-style
pkgver=1.0.2
pkgrel=1
pkgdesc="Make your i3 config a little more stylish"
arch=('i686' 'x86_64')
url="https://github.com/acrisci/i3-style"
license=('custom:FreeBSD')
depends=('gcc-libs')
makedepends=('rustup')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/altdesktop/i3-style/archive/v${pkgver}.tar.gz")
sha256sums=('44934a39094e43f541ffa2416c9f76cc400228c6104ae6b8f0df17e061af1a7b')

build() {
  cd "${pkgname}-${pkgver}"
  rustup install stable
  rustup default stable
  cargo build --release
}

package() {
  install -Dm644 "${pkgname}-${pkgver}/themes"/* -t "$pkgdir/usr/share/${pkgname}/themes/"
  install -Dm644 "${pkgname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "${pkgname}-${pkgver}/target/release/${pkgname}" "$pkgdir/usr/bin/${pkgname}"
}
# vim:set ts=2 sw=2 et: