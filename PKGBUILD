# Maintainer: dec05eba <dec05eba@protonmail.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Laurent Carlier <lordheavym@gmail.com>

pkgname=xf86-input-libinput-phoenix
pkgver=1.5.0
pkgrel=2
_commit=ac862672e4d04e78f2b647af9d3d14544454e4b9
_srcname=xf86-input-libinput-${_commit}
pkgdesc="Generic input driver for the X.Org server based on libinput"
arch=('x86_64')
license=('MIT')
url="http://xorg.freedesktop.org/"
depends=('libinput' 'glibc')
makedepends=('xorg-server-devel-phoenix' 'libxi' 'libx11' 'xorgproto' 'meson')
provides=("xf86-input-libinput=${pkgver}")
conflicts=('xf86-input-libinput' 'xorg-server<1.19.0' 'X-ABI-XINPUT_VERSION<26' 'X-ABI-XINPUT_VERSION>=27')
groups=('xorg-drivers')
source=(${_srcname}.tar.gz::https://github.com/dec05eba/xf86-input-libinput/archive/${_commit}.tar.gz)
sha512sums=('b85b2b28ddb1561ad5e76ab38232d7d4690f16d156cc314bb4e5658c22661cdb07c3c82a646a272c3164c7aacaa2d9ff956f185d5cb4e7eab10e53797a581352')

build() {
  arch-meson ${_srcname} build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"

  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" ${_srcname}/COPYING
}
