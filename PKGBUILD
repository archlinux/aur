# Maintainer: Martin Thierer <thierer@web.de>

pkgname=xmega65-git
pkgver=r4503d53e
pkgrel=1
pkgdesc='Mega65 target of the X-Emulators'
url='https://github.com/lgblgblgb/xemu/wiki/targets-mega65'
license=('GPL2')
depends=('sdl2' 'gtk3')
makedepends=('git')
provides=('xmega65')
arch=('x86_64')
source=('git+https://github.com/lgblgblgb/xemu.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/xemu"

  echo "r$(git describe --always)"
}

build() {
  cd "${srcdir}/xemu"

  make -C targets/mega65
  sed "s/%machine/MEGA65/g;s/%binary\|xemu/xmega65/g" build/xemu.desktop >build/xmega65.desktop
}

package() {
  cd "${srcdir}/xemu/build"

  install -D -m755 bin/xmega65.native ${pkgdir}/usr/bin/xmega65
  install -D -m644 xemu-48x48.xpm ${pkgdir}/usr/share/pixmaps/xmega65-48x48.xpm
  install -D -m644 -t ${pkgdir}/usr/share/applications/ xmega65.desktop
}
