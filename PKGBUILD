# Maintainer: Daniel Maslowski <info@orangecms.org>

_pyname=conda
pkgname=python-conda
pkgver=4.2.11
pkgrel=1
pkgdesc="OS-agnostic, system-level binary package manager and ecosystem"
arch=('any')
url="http://conda.pydata.org/docs/"
license=('BSD')
groups=()
depends=('python' 'python-pycosat>=0.6.1' 'python-requests' 'python-ruamel.yaml-hg')
makedepends=()
optdepends=(
  'python-conda-env: to use the conda env command'
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
sha512sums=('f2026e73e6d0c08f074189693fc5723c7d47e756ac82547a37b43c73b6ca4aa548311c5cad875418d95cce16b58b797c075c28ba7efb3b7ef1489aff8389733d')

package() {
  cd "$srcdir/${_pyname}-$pkgver"
  echo $pkgver > conda/.version
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm 644 shell/conda.fish $pkgdir/usr/share/fish/functions/conda.fish
  install -Dm 644 LICENSE.txt $pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt
}

# vim:set ts=2 sw=2 et:
