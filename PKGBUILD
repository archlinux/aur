# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=fsleyes-widgets
pkgver=0.7.2
pkgrel=1
pkgdesc="FSLeyes is the FSL image viewer, widgets is one of its dependent projects"
arch=('any')
url="https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FSLeyes"
license=('Apache')
groups=()
depends=('python')
makedepends=('python-six' 'python-numpy' 'python-matplotlib' 'python-wxpython>=4.0.1-2' 'python-deprecation')
optdepends=()
provides=()
conflicts=()
replaces=()
source=($pkgname-$pkgver.tar.gz::https://git.fmrib.ox.ac.uk/fsl/fsleyes/widgets/repository/archive.tar.gz?ref=$pkgver)
sha256sums=('1baca74720e7dc6ac6c9a58a30772c11c722dbf828a0026341b0a020cce35c18')

package() {
  cd "$srcdir/${pkgname#fsleyes-}-$pkgver-"*
  # "Patching" for deprecation 2.x support
  sed -i 's/deprecation>=1\.\*,<=2\.\*/deprecation>=1\.\*/g' requirements.txt
  # "Patching" for matplotlib>3 support
  sed -i 's/matplotlib>=1\.5,<3/matplotlib>=1\.5/g' requirements.txt
  python setup.py install --root="$pkgdir/" --optimize=1
}
