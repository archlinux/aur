# Maintainer: Cedric Girard <girard.cedric@gmail.com>
pkgname=cpp-alsa-volume
_upstreamname=cppAlsaVolume
pkgver=0.2.6
pkgrel=1
pkgdesc="Tray Alsa Volume Changer written using gtkmm"
arch=('x86_64' 'i686')
url="https://github.com/Vitozz/cppAlsaVolume"
license=('GPL2')
makedepends=('gtkmm' 'glibmm' 'alsa-lib' 'cmake')
depends=('gtkmm' 'glibmm' 'alsa-lib')
source=("https://github.com/Vitozz/cppAlsaVolume/archive/v${pkgver}.tar.gz"
        "https://github.com/Vitozz/cppAlsaVolume/commit/5ad2b3e23fecfdfdd9e87b9cd70b5c02fb31da39.patch")

prepare() {
	cd "$_upstreamname-$pkgver"
	patch -p1 -i "$srcdir/5ad2b3e23fecfdfdd9e87b9cd70b5c02fb31da39.patch"
}

build() {
	cd "$_upstreamname-$pkgver"
	cmake -DUSE_GTK3=OFF -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$_upstreamname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
md5sums=('51c9bec739b1a0174881dc6890096e58'
         '1066cf5d687eb82a1e3c76bbc8abe02b')
