# Maintainer: dr34m/KarlFiabeschi 1984itsnow[at]gmail[dot]com
# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=keep
pkgver=2.11
pkgrel=1
pkgdesc="A Meta CLI toolkit : Personal shell command keeper"
arch=('any')
url="https://github.com/OrkoHunter/keep"
license=('MIT')
depends=('python-click' 'python-requests' 'python-tabulate' 'python-terminaltables3' 'python-pygithub')
#RFC0020 Default to not using PyPI for Python package sources and only use the platform if there is no other alternative.
#source=("https://pypi.io/packages/source/k/keep/keep-$pkgver.tar.gz"
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-flit-core')
source=("$url/archive/$pkgver.tar.gz"
"$pkgname-LICENSE.md::https://raw.githubusercontent.com/OrkoHunter/keep/$pkgver/LICENSE.md")
sha256sums=('3fbe225069755f46dae2bdee61129904a15ad000c8a4050a8b38d6d3b371b4a7'
            'cdec0192e6b836d26da21b042893a8047b0b2792b933b464ac410509d8303459')

build() {
   cd "$srcdir/$pkgname-$pkgver"
   python -m build --wheel --no-isolation
}

package() {
   cd "$srcdir/$pkgname-$pkgver"
   python -m installer --destdir="$pkgdir/" dist/*.whl
   install -D -m644 "$srcdir/$pkgname-LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
