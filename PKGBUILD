# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=fslpy
pkgver=1.13.2
pkgrel=2
pkgdesc="The fslpy package is a collection of utilities and data abstractions used by FSLeyes."
arch=('any')
url="https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FSLeyes"
license=('Apache')
groups=()
depends=('python')
makedepends=('python-setuptools' 'python-six' 'python-numpy' 'python-scipy' 'python-deprecation' 'python-nibabel')
optdepends=()
provides=()
conflicts=()
replaces=()
source=($pkgname-$pkgver.tar.gz::https://git.fmrib.ox.ac.uk/fsl/fslpy/repository/archive.tar.gz?ref=$pkgver)
sha256sums=('f1f10d742b96f25357d6890c91e4cc13f7c18a44fd1c64e90601ef9be6ccff64')

package() {
  cd "$srcdir/${pkgname#fsleyes-}-$pkgver-"*
  # "Patching" for deprecation 2.x support
  sed -i 's/deprecation>=1\.\*,<=2\.\*/deprecation>=1\.\*/g' requirements.txt
  python setup.py install --root="$pkgdir/" --optimize=1
}
