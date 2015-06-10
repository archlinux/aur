# Maintainer: Niels Martignène <niels.martignene@gmail.com>

pkgname=xscope-git
pkgver=1.4.1.0.gd8267b3
pkgrel=1
pkgdesc="A program to monitor X11/Client conversations"
arch=('x86_64' 'i686')
url="http://cgit.freedesktop.org/xorg/app/xscope/"
license=('MIT')
depends=('glibc')
makedepends=('git' 'xproto' 'xtrans' 'xorg-util-macros')
conflicts=('xscope')
source=("git://anongit.freedesktop.org/xorg/app/xscope")
md5sums=('SKIP')

pkgver() {
  cd xscope
  git describe --long | sed -r 's/xscope-//;s/xscope-([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd xscope

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd xscope

  make DESTDIR="${pkgdir}/" install

  mkdir -p "${pkgdir}/usr/share/doc/xscope"
  install -Dm644 README "${pkgdir}/usr/share/doc/xscope/"

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 AUTHORS COPYING "$pkgdir/usr/share/licenses/${pkgname}/"
}

