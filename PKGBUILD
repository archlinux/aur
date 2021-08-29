# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=xorg-xinput-git
pkgver=1.6.3
pkgrel=1
pkgdesc="Small commandline tool to configure devices"
arch=(x86_64)
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('libx11' 'xorg-xrandr' 'libxinerama')
makedepends=('xorg-util-macros' 'xorgproto' 'libxfixes')
provides=(xorg-xinput)
conflicts=(xorg-xinput)
groups=('xorg-apps' 'xorg')
source=(git+https://gitlab.freedesktop.org/xorg/app/xinput)
sha512sums=('SKIP')
#validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF') # "Peter Hutterer (Who-T) <office@who-t.net>"

pkgver() {
  cd xinput
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd xinput
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd xinput
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
