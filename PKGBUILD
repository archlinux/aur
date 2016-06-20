# Maintainer: Daniel Maslowski <info@orangecms.org>

_pyname=conda
pkgname=python-conda
pkgver=4.1.2
pkgrel=2
pkgdesc="OS-agnostic, system-level binary package manager and ecosystem"
arch=('any')
url="http://conda.pydata.org/docs/"
license=('BSD')
groups=()
depends=('python' 'python-pycosat>=0.6.1' 'python-requests' 'python-yaml')
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
  activate.py.patch
)
sha512sums=('187ecd93c7a5984c5b8005909abd79447f4f47bb3060e4dc3247e1b6f597c65d69aee7169423c02cb32e32f5cdb110b9ebf143e985656372eef48987c6dca8aa'
            '0b9634efb153231fd690961e67ea9fd0afa39908ee053d40703ef26b75b2e597bab84e52e9ea6c1f85dbb2998d8b59b64bb2df7f7693abbe694054fc301f88d7')

package() {
  cd "$srcdir/${_pyname}-$pkgver"
  echo $pkgver > conda/.version
  patch -p1 conda/cli/activate.py "$srcdir/activate.py.patch"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm 644 shell/conda.fish $pkgdir/usr/share/fish/functions/conda.fish
  install -Dm 644 LICENSE.txt $pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt
}

# vim:set ts=2 sw=2 et:
