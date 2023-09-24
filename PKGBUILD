# Maintainer: MoetaYuko <loli at yuko dot moe>
# Contributor: Joakim Repomaa <aur@j.repomaa.com>

pkgname=python-yalafi
pkgver=1.4.0
pkgrel=5
pkgdesc="Yet another LaTeX filter"
url="https://github.com/torik42/YaLafi"
depends=('python' 'languagetool')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
license=('GPL3')
arch=('any')
source=(
    "https://github.com/torik42/YaLafi/archive/$pkgver.zip"
    "ltdirectory.patch"
)
sha256sums=('0062175c40659eb16beff26cb934f073c87f6e6e5f56657b713eb401ec6973cc'
            'ff59913ed6c4cc63dcf47f9604d5a096bd30e152f14e36ec53fa1e37793e5c10')

prepare() {
    cd YaLafi-$pkgver
    patch -p1 < "$srcdir/ltdirectory.patch"
}

build() {
    cd YaLafi-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd YaLafi-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
