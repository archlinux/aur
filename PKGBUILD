# Maintainer: Nikita Ivanov <nikita dot vyach dot ivanov at gmail dot com>
_name=dmenu-translate
pkgname="$_name-git"
pkgver=r11.26800e3
pkgrel=1
pkgdesc="Small shell script for translating text with dmenu"
arch=('any')
url="https://github.com/NikitaIvanovV/dmenu-translate"
license=('MIT')
depends=('dmenu' 'translate-shell' 'xclip' 'libnotify')
source=("git+$url")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/${_name}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    local license_prefix="$pkgdir/usr/share/licenses/$pkgname"
    mkdir -p "$license_prefix"
    cp "$srcdir/$_name/LICENSE" "$license_prefix"

    cd "$srcdir/${_name}"
	make PREFIX="/usr" DESTDIR="$pkgdir" install
}
