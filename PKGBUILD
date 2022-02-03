_pkgname=osmscout-server
_flavor=qtcontrols
pkgname=$_pkgname-$_flavor
pkgver=2.1.2
pkgrel=1
arch=("x86_64" "aarch64")
url="https://github.com/rinigus/osmscout-server"
source=("$_pkgname-$pkgver::git+${url}#tag=$pkgver")
sha256sums=('SKIP')
depends=("mapnik" "valhalla" "libpostal" "marisa" "kyotocabinet")

prepare() {
	cd "$_pkgname-$pkgver"
	git submodule update --init --recursive
}

build() {
	mkdir build
	cd build
	qmake PREFIX=/usr SCOUT_FLAVOR=$_flavor ../"$_pkgname-$pkgver"/osmscout-server.pro
	make
}

package() {
	make -C build INSTALL_ROOT="$pkgdir" install
}
