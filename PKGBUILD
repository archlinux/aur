# Maintainer: Premysl Srubar <premysl.srubar at gmail com>
pkgname=python-pyfakewebcam-git
pkgver=r0.1.0.r10.g41abbab
pkgrel=2
pkgdesc="An API for writing RGB frames to a fake webcam device on Linux"
arch=('any')
url="https://github.com/jremmons/pyfakewebcam"
license=("GPL3")
depends=('python-numpy')
makedepends=('git' 'python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {  
  cd "$srcdir/${pkgname}"
  python setup.py build
}

package() {
    depends+=('v4l2loopback-dkms')
    cd "$srcdir/${pkgname}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

