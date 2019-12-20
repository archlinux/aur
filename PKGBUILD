# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com> 
# Contributor: Slithery <aur [at] slithery [dot] uk>

pkgname=linode-cli
pkgver=2.12.0
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
sha256sums=('0e0ae22346b1eec3d8d87b74b0130aa2a7074c6c6a1e03082ed52ec99ef81197'
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
