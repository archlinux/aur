# Maintainer: Tom Wadley <tom@tomwadley.net>

pkgname=librem5-flash-image-git
pkgver=v0.0.4.r2.ge501c45
pkgrel=1
pkgdesc="Image flashing tool for Librem 5 devices and related devices"
url="https://source.puri.sm/Librem5/librem5-flash-image"
arch=('any')
license=('GPL3')
depends=('python' 'python-coloredlogs' 'python-python-jenkins' 'python-requests' 'python-tqdm' 'python-yaml' 'usbutils' 'mfgtools')
makedepends=('git')
provides=('librem5-flash-image')
conflicts=('librem5-flash-image')
source=("$pkgname::git+https://source.puri.sm/Librem5/librem5-flash-image.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 scripts/librem5-flash-image "$pkgdir/usr/bin/librem5-flash-image"
  install -Dm644 debian/librem5-flash-image.librem5.udev "$pkgdir/etc/udev/rules.d/70-librem5-flash-image.rules"
}

# vim:set ts=2 sw=2 et:
