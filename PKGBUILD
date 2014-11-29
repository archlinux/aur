# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=hot-babe
pkgver=0.2.2
pkgrel=11
pkgdesc="A system load monitor that displays the system activity in a very special way"
arch=('i686' 'x86_64')
url="http://packages.medibuntu.org/maverick/hot-babe.html"
license=('custom')
depends=('gtk2' 'desktop-file-utils')
makedepends=('pkgconfig')
install=$pkgname.install
source=(http://jolicloud.mirror.dkm.cz/pub/jolicloud/apt/mirrors/pool/free/h/$pkgname/${pkgname}_${pkgver}.orig.tar.gz
        $pkgname.desktop)
md5sums=('70d50f5d22e3637a2f623d37e9a473ab'
         '8768a6a7c5ebfc4eda791ea8be1a615a')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  sed -i -e 's|/local||g' -e 's|-g||g' Makefile
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install

  install -D -m644 "${srcdir}"/$pkgname.desktop "${pkgdir}"/usr/share/applications/$pkgname.desktop
  install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
