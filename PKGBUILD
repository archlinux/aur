# Maintainer: Javier Torres <jtorres@carto.com>
pkgname=carto-crankshaft
pkgver=0.5.2.r0.ce5d1f9
pkgrel=1
pkgdesc="CARTO Spatial Analysis extension for PostgreSQL "
arch=('x86_64')
url="https://github.com/CartoDB/crankshaft"
license=('BSD')
groups=()
depends=('python2' 'python2-joblib' 'python2-pysal' 'python2-scikit-learn')
makedepends=('git' 'python2-pip')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/CartoDB/crankshaft.git')
noextract=()
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/crankshaft"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/crankshaft"

  sed -i "s|pip install|pip2 install --root=$pkgdir|g" src/py/Makefile
}

build() {
	cd "$srcdir/crankshaft"
}

package() {
	cd "$srcdir/crankshaft"

  install -d "$pkgdir/usr/share/postgresql/extension/"
  make deploy DESTDIR="$pkgdir" RUN_OPTIONS='--no-deps'
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
