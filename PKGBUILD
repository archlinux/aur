# Maintainer: alba4k <blaskoazzolaaaron@gmail.com>
pkgname=albafetch
pkgver=4.3
pkgrel=1
pkgdesc="Neofetch, but written in C; both faster and worse than the original"
arch=(x86_64 aarch64)
url="https://github.com/alba4k/albafetch"
license=('MIT')
depends=(glib2 pciutils sqlite)
makedepends=(git make meson gcc pkgconf)
provides=($pkgname=$pkgver)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")

backup=("etc/xdg/albafetch.conf")

md5sums=('b253498e2abb0df220350f2968945dbc')

build() {
    cd $pkgname-$pkgver
    meson setup build
    meson compile -C build
}

check() {
    echo -e "\e[33m\e[1mTesting every module.\e[0m Feel free to report anything not working on https://github.com/alba4k/albafetch/issues"
    $pkgname-$pkgver/build/albafetch --debug --no-pip
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 build/albafetch $pkgdir/usr/bin/albafetch

    install -Dm644 albafetch.conf $pkgdir/etc/xdg/albafetch.conf
	install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
	install -Dm644 README.md $pkgdir/usr/share/doc/$pkgname/README.md
	install -Dm644 MANUAL.md $pkgdir/usr/share/doc/$pkgname/MANUAL.md
}

