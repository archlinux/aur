# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=fslpy
pkgver=1.3.1
pkgrel=2
pkgdesc="The fslpy package is a collection of utilities and data abstractions used by FSLeyes."
arch=('any')
url="https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FSLeyes"
license=('Apache')
groups=()
depends=('python')
makedepends=('python-six' 'python-numpy' 'python-matplotlib' 'python-deprecation' 'python-nibabel' 'wxpython-phoenix' 'python-indexed-gzip')
optdepends=()
provides=()
conflicts=()
replaces=()
source=($pkgname-$pkgver.tar.gz::https://git.fmrib.ox.ac.uk/fsl/fslpy/repository/archive.tar.gz?ref=$pkgver)
sha256sums=('f7dac9d62cfb6d9cee7c9a55a38ddb086e897cdafc3cabd6ad9d3d46d7c2710f')

package() {
  cd "$srcdir/${pkgname#fsleyes-}-$pkgver-"*
  # "Patching" for scipy 1.0 support
  sed -i 's/scipy>=0\.18,<1/scipy/g' requirements.txt
  python setup.py install --root="$pkgdir/" --optimize=1
}
