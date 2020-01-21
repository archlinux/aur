pkgname=toot
_name=toot
pkgver=0.25.0
pkgrel=1
pkgdesc="a Mastodon CLI client"
depends=('python-requests' 'python-beautifulsoup4' 'python-wcwidth' 'python-urwid')
license=('GPL3')
arch=('any')
url="https://github.com/ihabunek/toot"
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz)
sha256sums=('eac52d728750aca6cd9985f5fb5dc4d4564b40bdfbf5bcbbbeacf38ae3114a46')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

    rm $pkgdir/usr/CHANGELOG.md
    mkdir -p $pkgdir/usr/share/licenses/toot
    mv $pkgdir/usr/LICENSE $pkgdir/usr/share/licenses/toot/
}
