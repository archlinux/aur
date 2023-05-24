# Maintainer: ThecaTTony <thecattony at gmx dot com>

pkgname=nginx-mod-length-hiding-filter
pkgver=1.1.1
pkgrel=8

_modname=nginx-length-hiding-filter-module

pkgdesc='Nginx module to append random generated string to the end of HTML response'
arch=('x86_64' 'armv7h' 'aarch64')
depends=('nginx')
makedepends=("nginx-src")
url='https://github.com/nulab/nginx-length-hiding-filter-module'
license=('MIT')

source=(https://github.com/nulab/nginx-length-hiding-filter-module/archive/$pkgver.tar.gz)

sha512sums=('3eebd28808241daf26081126249174704a08aca9c0ff42e00875f7439de49e53e3cdb40e956e388ccb8b8bd5fff0103e97f6f38aa0d84d22f2f6f56295f60bec')


prepare() {
	mkdir -p build
	cd build
	ln -sf /usr/src/nginx/auto
	ln -sf /usr/src/nginx/src
}

build() {
	cd build
	/usr/src/nginx/configure --with-compat --add-dynamic-module=../$_modname-$pkgver
	make modules
}

package() {
	cd build/objs
	for mod in *.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done
}
