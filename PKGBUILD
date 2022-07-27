# Maintainer: Nikita Ivanov <nikita dot vyach dot ivanov at gmail dot com>
_name=catless
pkgname="$_name-git"
pkgver=r1.4ad51f9
pkgrel=1
pkgdesc="cat and less in one program"
arch=('any')
url="https://github.com/NikitaIvanovV/catless"
license=('MIT')
depends=('gawk' 'less')
provides=("$_name")
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
