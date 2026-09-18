# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-peewee-migrate"
pkgver=2.3.0
pkgrel=1
pkgdesc="Simple migration engine for Peewee"
url="https://github.com/klen/peewee_migrate"
license=("MIT")
arch=("any")
provides=("peewee-migrate" "pw-migrate" "pw_migrate")
depends=("python-peewee>=4.4" "python-click")
makedepends=("python-build" "python-installer" "python-uv-build")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('3037f0b8650bd1d554a9e3e485ee5d944d4b34141c1bf937e0d7b5798b403a0dfc7ee6c78027ffe72ac2cae20166ad2cd603820b8e6af05163c82ddc22f26e27')
options=("!strip")

build(){
 cd "peewee_migrate-$pkgver"
 # upstream pins uv_build<0.11, Arch ships a newer one that builds this fine
 python -m build --wheel --no-isolation --skip-dependency-check
}

package(){
 cd "peewee_migrate-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
 install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
