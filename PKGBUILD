# Maintainer: hawkeye116477 <hawkeye116477 at gmail.com>
pkgname=groupsdomainsextractor
_name=GDE
pkgver=1.3.0
pkgrel=1
pkgdesc="Find all domains of specific group and copy it to clipboard"
url="https://github.com/FiltersHeroes/ScriptsPlayground/blob/master/Readme_GDE.md"
license=('GPL3')
depends=('python' 'python-beautifulsoup4' 'python-tldextract' 'python-requests' 'python-qtpy' 'qt5-python-bindings' 'python-platformdirs' 'gettext')
makedepends=(python-setuptools python-build python-installer python-wheel)
arch=('any')
source=(
	"https://github.com/FiltersHeroes/ScriptsPlayground/releases/download/GDE-$pkgver/GDE-$pkgver.tar.gz"
)
sha256sums=('40ff6372ba05c2d7001c70f3086eb3ec6a16c5c7bcb1a6dfc0ddab5e973486ea')

build() {
    cd "$_name-$pkgver" || exit
    python -m build --wheel --no-isolation
}

package()
{
    cd "$_name-$pkgver" || exit
    python -m installer --destdir="$pkgdir" dist/*.whl
    mkdir -p "$pkgdir"/usr/share/applications
    install -Dm755 "$srcdir/$_name-$pkgver/GDE/shortcuts/share/applications/GDE.desktop" "$pkgdir"/usr/share/applications/
}
