# Maintainer: Donnie Bishop <donnie.a.bishop@gmail.com>

pkgname=legofy-git
pkgver=r188.004d111
pkgrel=1
pkgdesc="Make images look as if they are made out of 1x1 LEGO blocks"
arch=('any')
url="https://github.com/JuanPotato/Legofy"
license=('MIT')
depends=('python-pillow' 'python-click')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
provides=("legofy")
conflicts=("legofy")
options=(!emptydirs)
source=("$pkgname::git+${url}")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
