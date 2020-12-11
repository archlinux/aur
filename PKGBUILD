# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname=nodemcu-uploader-git
_gitname=nodemcu-uploader
pkgver=v1.0.0.r0.g6893b41
pkgrel=1
pkgdesc="tool for uploading files to the filesystem of an ESP8266 running NodeMCU."
arch=("any")
url="https://github.com/kmpm/nodemcu-uploader"
license=('MIT')
depends=('python-pyserial')
makedepends=('git')
provides=("${_gitname}")
conflicts=("${_gitname}")
source=("git+https://github.com/kmpm/nodemcu-uploader")
sha256sums=('SKIP')

pkgver() {
  cd $_gitname

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
	
build() {
  cd $_gitname

  python setup.py build
}

package() {
  cd $_gitname
  
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set sw=2 ts=2 et:
