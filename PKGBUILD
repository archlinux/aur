# Maintainer: Nikita Ivanov <nikita dot vyach dot ivanov at gmail dot com>
_name=dmenu-win
pkgname="$_name-git"
pkgver=r19.2a471d4
pkgrel=1
pkgdesc="Switch between windows with dmenu"
arch=('any')
url="https://github.com/NikitaIvanovV/dmenu-win"
license=('MIT')
provides=("$_name")
depends=('dmenu' 'xorg-xprop' 'xdotool')
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
