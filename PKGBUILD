# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=health
_reponame=Health
pkgver=0.94.0
pkgrel=4
pkgdesc="A health tracking app for the GNOME desktop"
arch=(x86_64)
url=https://gitlab.gnome.org/World/Health
license=(GPL3)
depends=(libadwaita gtk4)
checkdepends=(appstream-glib)
makedepends=(meson rust blueprint-compiler)
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$_reponame-$pkgver.tar.gz"
        "blueprint_version_0.94.0.patch"
        "max_value_0.94.0.patch"
        "max_size_tightending_thresh_0.94.0.patch")
sha512sums=('2cf4314de185c2ad8c42cd51385e7b9ab895932a429e6afb2ece29f24da951b49cb5e8ef184c377cc48a1e6bf6f997c0cd539623a4c5603e91dff70219c4bcab'
            '91d20d5e74de2b3a45ab2a2393d24bee8a434c006904e0bf0844f8acac1f0006d2d3357cd5c48b7401a9dd45ffda9e5c89087357b2a8bbaf15a11d62373d5280'
            '24b43f8127d0d0250f4198dd77f8e4a7ceadb0e21e67adfcf147a5992b429ad73d4fa7c46cc30f43a2aef0a505f259ddf380b0043894a742c10cc7053c9a9301'
            '79b5e8b757a131820ee8c42fb2e8d30a867194692b72ebafd34c82131ec620aca790744911d7a01740a657b5c3ce60efa0a4aa34be07470d3e77f23b84ffac7c')

prepare() {
	cd "$_reponame-$pkgver"
	patch -p1 -i "$srcdir/blueprint_version_0.94.0.patch"
	patch -p1 -i "$srcdir/max_value_0.94.0.patch"
	patch -p1 -i "$srcdir/max_size_tightending_thresh_0.94.0.patch"
}

build() {
	arch-meson "$_reponame-$pkgver" build
	meson compile -C build
}

check() {
	# meson test -C build --print-errorlogs
	:
}

package() {
	meson install -C build --destdir "$pkgdir"
}
