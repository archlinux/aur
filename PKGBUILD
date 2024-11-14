# Maintainer: Stuart Cardall <developer at it-offshore dot co dot uk>
pkgname=distrobuilder-menu
pkgver=0.2.9
pkgrel=2
pkgdesc="A python console frontend to Distrobuilder for building standard or customised LXD / LXC images"
arch=(any)
url="https://github.com/itoffshore/distrobuilder-menu"
license=(MIT)
depends=(python-urllib3 python-yaml)
makedepends=(python-build python-installer python-hatchling)
optdepends=('go-yq: merge cloudinit configuration with yq')
source=($pkgname-$pkgver.tar.gz::${url}/archive/${pkgver}.tar.gz)
md5sums=('35569f29d4b43f9d80ad358e715b6ec1')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
}
