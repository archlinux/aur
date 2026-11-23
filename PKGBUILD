# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-peewee-migrate"
pkgver=2.5.0
pkgrel=1
pkgdesc="Simple migration engine for Peewee"
url="https://github.com/klen/peewee_migrate"
license=("MIT")
arch=("any")
provides=("peewee-migrate" "pw-migrate" "pw_migrate")
depends=("python" "python-peewee>=4.4" "python-click")
makedepends=("python-build" "python-installer" "python-uv-build" "python-wheel")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('4c3b03cce6b50ced63b719450cd68727588714a80301bd06edd940976ff19d3a5c3014921b3fc3608982422c8596581246c89c7e4f890478a966b4f9ca863c77')
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
