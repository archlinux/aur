# Maintainer: Vincent Grande <shoober420@gmail.com>
# Contributor: Det <thatone>
# Contributor: Laurent Carlier <lordheavym@gmail.com>

pkgname=xf86-input-libinput-git
pkgver=0.28.1.1.r250.g4985de5
pkgrel=1
pkgdesc="Generic input driver for the X.Org server based on libinput"
arch=('x86_64')
license=('custom')
url="http://xorg.freedesktop.org/"
depends=('libinput')
makedepends=('xorg-server-devel' 'libxi' 'libx11' 'xorgproto')
optdepends=('xorg-xinput: input configuration for X')
conflicts=('xorg-server<1.19.0' 'X-ABI-XINPUT_VERSION<24' 'X-ABI-XINPUT_VERSION>=25')
provides=('xf86-input-libinput')
conflicts=('xf86-input-libinput')
groups=('xorg-drivers')
source=("git+https://gitlab.freedesktop.org/xorg/driver/xf86-input-libinput")
sha512sums=('SKIP')
validpgpkeys=('SKIP') # Peter Hutterer (Who-T) <office@who-t.net>

pkgver() {
  cd xf86-input-libinput
  
  echo $(git describe --long | cut -d "-" -f4-5 | tr - .).r$(git rev-list HEAD --count).$(git describe --long | cut -d "-" -f6)
}

build() {
  cd xf86-input-libinput

  ./autogen.sh  --prefix=/usr \
                --disable-static
  make
}

package() {
  cd xf86-input-libinput

  make DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/licenses/xf86-input-libinput"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/xf86-input-libinput/"
}
