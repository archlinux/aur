# Maintainer: Jouni Rinne <l33tmmx swirlything gmail dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=waybackpack
pkgver=0.6.4
pkgrel=1
pkgdesc="Download the entire Wayback Machine archive for a given URL."
arch=('any')
url="https://github.com/jsvine/waybackpack"
license=('MIT')
depends=('python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('python-tqdm: progress bar support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jsvine/waybackpack/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d112cd09addbca0b02cb356388063a57f6d842c870a53bf58d578c7a82bee91f')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*whl
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
