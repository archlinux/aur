# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com> 
# Contributor: Slithery <aur [at] slithery [dot] uk>

pkgname=linode-cli
pkgver=2.4.0
pkgrel=1
pkgdesc='Linode API wrapper'
url='https://github.com/linode/linode-cli'
arch=('any')
license=('BSD')
makedepends=('python-wheel' 'python2-wheel')
depends=('python-colorclass' 'python2-colorclass' 'python-terminaltables' 'python2-terminaltables' 'python-requests' 'python2-requests' 'python-yaml' 'python2-yaml' 'python2-enum34')
replaces=('linode-cli-dev')
install=linode-cli.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/linode/linode-cli/archive/${pkgver}.tar.gz"
	enum34-extra-requires.patch)
sha256sums=('27bb2a6e0cfa96f0ca5e6f02f27b69e73557c68f0e334acd4756167a9bb1d2b5'
            '3c05e163748ec607c3f6d62587e04911af2e593e25635c7acef39cd2d03f9f2e')

prepare() {
  cd "$srcdir/$pkgname-$pkgver" 
  patch --strip=2 --input="${srcdir}/enum34-extra-requires.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver" 
  make build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 "$srcdir"/"$pkgname"-"$pkgver"/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
