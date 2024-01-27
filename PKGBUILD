# Maintainer: Amirhossein Banavi <ahbanavi at gmail dot com>

pkgname='python-bonbast'
_name=${pkgname#python-}
pkgver='1.0.2'
pkgrel=1
pkgdesc="Get currencies exchange rates for IRR from Bonbast.com"
url="https://github.com/SamadiPour/bonbast"
depends=(
    'python'
    'python-rich'
    'python-requests'
    'python-beautifulsoup4'
    'python-click'
)
makedepends=(python-build python-installer python-wheel)
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('dc00114c00c5c976b1144d65741c30ede003d3b0313942a33298e8d3264597a1')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}
 
package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
