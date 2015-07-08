# Maintainer: Sigmund Vestergaard <sigmundv at gmail dot com>
# Contributor: Feng Wang <feng[dot]wang[at]uni-ulm[dot]de>
# Contributor: Wesley Bowman <wesley.bowman23@gmail.com>

# You can always get the latest version on GitHub (those are unstable) with the
# command:
# sudo pip2 install --upgrade git+https://github.com/lebedov/scikits.cuda.git#egg=scikit

pkgname=scikits-cuda
pkgver=0.5.0b3
pkgrel=1
pkgdesc="Python interface to GPU-powered libraries"
arch=('any')
url="http://scikits.appspot.com/cuda"
license=('BSD')
depends=('python2' 'python2-numpy' 'python2-scipy' 'scikits-base' 'cuda' 'cula')
makedepends=('python2-setuptools' 'subversion')
source=(https://pypi.python.org/packages/source/s/scikits.cuda/scikits.cuda-${pkgver}.tar.gz)
sha256sums=('8d6bfd4a2ce116a34f3c656d4167a380a3d7f4f03bf10008a4acc0b5ee2abca5')

package() {
  cd ${srcdir}/scikits.cuda-${pkgver}

  # ignores any LDFLAGS set in makepkg.conf
  unset LDFLAGS

  python2.7 ./setup.py install --root=${pkgdir}

  sed -i 's/libcula\.so/libcula_lapack\.so/g' ${pkgdir}/usr/lib/python2.7/site-packages/scikits/cuda/cula.py

  rm ${pkgdir}/usr/lib/python2.7/site-packages/scikits/__init__.py
}

