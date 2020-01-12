# Maintainer: xiretza <xiretza+aur@gmail.com>
# Contributor: getzze <getzze at gmail dot com>

pkgname=python-ffmpeg
_pkgname='ffmpeg-python'
pkgver=0.2.0
pkgrel=1
pkgdesc="Python bindings for FFmpeg - with complex filtering support"
arch=(any)
url="https://github.com/kkroening/ffmpeg-python"
license=('Apache')
options=(!emptydirs)
depends=('ffmpeg' 'python-future')
makedepends=('python-setuptools' 'python-pytest-runner')
checkdepends=('python-pytest' 'python-pytest-mock')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kkroening/ffmpeg-python/archive/${pkgver}.tar.gz")
sha256sums=('01b6b7640f00585a404194a358358bdf7f4050cedcd99f41416ac8b27222c9f1')

build() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  python setup.py build
}

check(){
  cd "$srcdir/${_pkgname}-${pkgver}"
  pytest
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
