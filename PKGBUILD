# Maintainer: Mads Kjeldgaard<mail@madskjeldgaard.dk>
pkgname=supercollider-autotune-git
pkgver=r6.cc9fedf
pkgrel=1
pkgdesc='Description'
arch=('any')
url='https://github.com/bolkaaa/autotune'
license=('GPL')
groups=('pro-audio' 'supercollider-plugins')
depends=('supercollider')
makedepends=('git' 'cmake' 'supercollider-headers-git')
optdepends=()
source=("$pkgname-$pkgver"::git+$url.git)
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname-$pkgver"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
		cd "$srcdir/$pkgname-$pkgver"
		mkdir build; cd build
		SC_SRC="/usr/share/supercollider-headers"
		cmake -DSC_PATH=$SC_SRC -DCMAKE_BUILD_TYPE=RELEASE ..
		make
}


package() {
	cd "$srcdir/$pkgname-$pkgver"

	DEST="$pkgdir/usr/share/SuperCollider/Extensions/AutoTune"
	mkdir -p $DEST;

	install -Dm755 ./build/AutoTune.so $DEST/
	install -Dm755 ./SC/AutoTune.sc $DEST/

}

