# Maintainer: Saverio Brancaccio <saverio.brancaccio@gmail.com>
# Contributor: Sapphira Armageddos <shadowkyogre.public@gmail.com>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Bram Schoenmakers <me@bramschoenmakers.nl>

pkgname=evolvotron
pkgver=0.8.1
pkgrel=1
pkgdesc="An interactive generative art application"
arch=('i686' 'x86_64')
url="http://www.timday.com/share/evolvotron/index.htm"
license=('GPL')
depends=('qt5-base' 'boost-libs')
makedepends=('boost')
source=("$pkgname-$pkgver.tar.gz::https://github.com/WickedSmoke/evolvotron/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=("6852469db0e0a19340a7d035eda1720aa2eb36b11d84289b50699997594b945f5991e62607d010b82f02e1da2434e057d694d295f45a5a0f52078d5f8bfd1121")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  qmake-qt5 "VERSION_NUMBER=$(./VERSION)" main.pro
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  for bin in ${pkgname}{,_mutate,_render}; do
    install -D -m 755 "${bin}/${bin}" "${pkgdir}/usr/bin/${bin}"
  done
  for man in ${pkgname}{,_mutate,_render}.1; do
    install -D -m 644 "man/man1/${man}" "${pkgdir}/usr/share/man/man1/${man}"
  done
  install -D -m 644 evolvotron.html "${pkgdir}/usr/share/doc/${pkgname}/manual.html"
  install -Dm644 "dist/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "dist/icon-128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"
  install -Dm644 "dist/icon-48.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${pkgname}.png"
}
