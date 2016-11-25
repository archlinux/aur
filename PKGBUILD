# Maintainer: Daniel Maslowski <info@orangecms.org>

_pyname=conda
pkgname=python-conda
pkgver=4.2.12
pkgrel=1
pkgdesc="OS-agnostic, system-level binary package manager and ecosystem"
arch=('any')
url="http://conda.pydata.org/docs/"
license=('BSD')
groups=()
depends=('python' 'python-pycosat>=0.6.1' 'python-requests' 'python-ruamel.yaml-hg')
makedepends=()
optdepends=(
  'python-conda-build: to use the conda build command'
)
provides=('conda' 'activate' 'deactivate')
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(
  https://github.com/$_pyname/$_pyname/archive/$pkgver.tar.gz
)
sha512sums=('bc5c85fa0c6824e4e9ee29ad57331f0e342905be84ee450643644e4a71c3bb77b500e4c505643e32ebd12f07b5b03de6603ac9e2f156cd64b3758ea440a3d399')

package() {
  cd "$srcdir/${_pyname}-$pkgver"
  echo $pkgver > conda/.version
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm 644 shell/conda.fish $pkgdir/usr/share/fish/functions/conda.fish
  install -Dm 644 LICENSE.txt $pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt
}

# vim:set ts=2 sw=2 et:
