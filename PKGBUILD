# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=fsleyes-props
pkgver=1.6.5
pkgrel=1
pkgdesc="The fsleyes-props project is an event programming framework, which includes the ability for automatic CLI generation and, optionally, automatic GUI generation (if wxPython is present). It is used by FSLeyes."
arch=('any')
url="https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FSLeyes"
license=('Apache')
groups=()
depends=('python')
makedepends=('python-six' 'python-numpy' 'python-matplotlib' 'python-deprecation' 'python-wxpython>=4.0.1-2' 'fslpy>=1.11.1' 'fsleyes-widgets>=0.7.3')
optdepends=()
provides=()
conflicts=()
replaces=()
source=($pkgname-$pkgver.tar.gz::https://git.fmrib.ox.ac.uk/fsl/fsleyes/props/repository/archive.tar.gz?ref=$pkgver)
sha256sums=('b3c55b602bcc52bbea25de8f18b28ad1bf4f378fbaa5e46cd10db3af2bef3c02')

package() {
  cd "$srcdir/${pkgname#fsleyes-}-$pkgver-"*
  # "Patching for deprecation 2.x support
  sed -i 's/deprecation>=1\.\*,<=2\.\*/deprecation>=1\.\*/g' requirements.txt
  # "Patching" for matplotlib>3 support
  sed -i 's/matplotlib>=1\.5,<3/matplotlib>=1.5.1/g' requirements.txt
  python setup.py install --root="$pkgdir/" --optimize=1
}
