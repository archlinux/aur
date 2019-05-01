# Maintainer: Ashwin <ashuwish+arch@gmail.com>

_hgproj=fluiddyn
_hgrepo=fluiddyn
_hgver=0.2.4
pkgname=python2-fluiddyn-hg
pkgver=0.2.4.r406.ff507350df1f
pkgrel=2
pkgdesc="FluidDyn project | Framework for studying fluid dynamics."
arch=('any')
url="https://bitbucket.org/${_hgproj}/${_hgrepo}"
license=('custom:"CeCILL-B"')
depends=(
  'python2' 'python2-numpy' 'python2-matplotlib' 'python2-h5py' 'python2-psutil' 'python2-future'
)
optdepends=(
  'python2-h5netcdf: Read and write netcdf4 files'
  'python2-pyfftw: Calculate FFT'
  'python2-pillow: Image I/O'
)
makedepends=('mercurial' 'python2-setuptools')
provides=(python2-${_hgrepo})

source=("hg+${url}")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${_hgrepo}"
  hg update ${_hgver}
}

pkgver() {
  cd "${srcdir}/${_hgrepo}"
  echo $(hg parents --template '{word(-1,latesttag,":")}').r$(hg identify -n).$(hg identify -i)
}

build() {
  cd "${srcdir}/${_hgrepo}"
  python2 setup.py build
}

# check() {
#   cd "${srcdir}/${_hgrepo}"
#   python2 -m unittest discover
# }

package() {
  cd "${srcdir}/${_hgrepo}"
  python2 setup.py install --root=$pkgdir
  install -D -m644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}
