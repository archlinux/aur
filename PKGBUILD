# Maintainer: Flávio Zavan <flavio dot zavan at gmail dot com>
# Contributor: pingplug
# Contributor: perlawk
# Contributor: xsmile

pkgname=python-dlib
pkgname=('python-dlib' 'python2-dlib')
_pkgname=dlib
pkgver=19.2
pkgrel=2
pkgdesc="Dlib is a general purpose cross-platform C++ library designed using contract programming and modern C++ techniques."
arch=('any')
url="http://www.dlib.net/"
license=('Boost Software License')
makedepends=('cmake' 'boost')
optdepends=('cblas: for BLAS support'
            'lapack: for LAPACK support'
            'libjpeg-turbo: for JPEG support'
            'libpng: for PNG support'
            'sqlite: for sqlite support')
source=(http://downloads.sourceforge.net/project/dclib/${_pkgname}/v${pkgver}/${_pkgname}-${pkgver}.tar.bz2)
md5sums=('12786b3765cc98193c404ccf3c88c900')

avx_available=''
if grep -q avx /proc/cpuinfo; then
  avx_available='--yes USE_AVX_INSTRUCTIONS'
fi

build(){
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build $avx_available
  python2 setup.py build $avx_available
}

package_python-dlib(){
  depends=('python')

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
}

package_python2-dlib(){
  depends=('python2')

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
}
