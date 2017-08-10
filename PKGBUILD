# Maintainer: Daniel Maslowski <info@orangecms.org>

_pyname=conda
pkgname=python-conda
pkgver=4.3.24
pkgrel=1
pkgdesc="OS-agnostic, system-level binary package manager and ecosystem"
arch=('any')
url="http://conda.pydata.org/docs/"
license=('BSD')
depends=('python' 'python-pycosat>=0.6.1' 'python-requests' 'python-ruamel-yaml')
optdepends=(
  'python-conda-build: to use the conda build command'
)
provides=('python-conda' 'python-conda-env')
options=(!emptydirs)
source=(
  https://github.com/$_pyname/$_pyname/archive/$pkgver.tar.gz
)
sha512sums=('c2cc271b7af4e372f5f1136f1eb995540acabfa1fed09b0ff2f53464755a88d3693c16876d1ef73e02e8d3ca41450008b6b615beca3c9f208dc36c0246c39b1e')

package() {
  cd "$srcdir/${_pyname}-$pkgver"
  echo $pkgver > conda/.version
  python utils/setup-testing.py install --root="$pkgdir/" --optimize=1
  install -Dm 644 shell/conda.fish $pkgdir/usr/share/fish/functions/conda.fish
  install -Dm 644 LICENSE.txt $pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt
}

# vim:set ts=2 sw=2 et:
