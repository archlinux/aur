# Maintainer: éclairevoyant
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=yishu
pkgver=1.2.5
pkgrel=2
pkgdesc='Bespoke and simple Todo.txt client'
arch=('x86_64')
url="https://github.com/lainsce/$pkgname"
license=('GPL3')
depends=('granite')
makedepends=('meson' 'vala')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('d069ba0c1e4a0da34dd9c4b659308feb20ba5e55d18f707b0a6a58bc00e0d03fba887542ff841f6a4631d957e545733df5c14045ac0c4996103ecdf3933a828b')

_meson_proj_name=com.github.lainsce.yishu

prepare() {
	cd $pkgname-$pkgver
	sed -i "s/meson.project_name()/'$pkgname'/g" meson.build
	sed -i "/output/ s/meson.project_name()/'$pkgname'/g" data/meson.build
	sed -i "s/$_meson_proj_name/$pkgname/g" data/$_meson_proj_name.appdata.xml.in
	sed -i "/Exec/ s/$_meson_proj_name/$pkgname/g" data/$_meson_proj_name.desktop.in
}

build() {
	arch-meson "$pkgname-$pkgver" build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
	install -Dm644 $pkgname-$pkgver/README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
