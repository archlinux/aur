# Maintainer: yjun <jerrysteve1101@gmail.com>
# Contributor: Yuval Adam <yuv dot adm at gmail dot com> PGP-Key: CC2115C12D99D2F0

pkgname=micronucleus-git
_gitname=micronucleus
pkgver=2.04.r6.g4d2481d
pkgrel=1
pkgdesc="ATTiny usb bootloader with a strong emphasis on bootloader compactness"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/micronucleus/micronucleus"
license=('GPL')
depends=('libusb-compat')
makedepends=('git')
provides=('micronucleus')
source=("git+$url")
options=('!makeflags')
sha1sums=('SKIP')

pkgver() {
  cd $_gitname

  git describe --tags | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_gitname/commandline"

  make
}

package() {
  cd "${srcdir}/${_gitname}/commandline"

  install -Dm755 micronucleus -t "${pkgdir}/usr/bin/"
  install -Dm644 49-micronucleus.rules -t "${pkgdir}/usr/lib/udev/rules.d/"
}

# vim:set ts=2 sw=2 et:
