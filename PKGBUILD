# Maintainer: Nikita Ivanov <nikita dot vyach dot ivanov at gmail dot com>
_name=shortbashpwd
pkgname="$_name-git"
pkgver=r3.7571394
pkgrel=1
pkgdesc="Shorter working directory in prompt like in fish shell"
arch=('any')
url="https://github.com/NikitaIvanovV/shortbashpwd"
license=('MIT')
depends=('bash' 'coreutils')
provides=("$_name")
source=("git+$url")
sha512sums=('SKIP')
install="${_name}.install"

pkgver() {
    cd "$srcdir/${_name}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${_name}"
    sed -i "/grep/d; /@echo/d" Makefile
}

package() {
    local license_prefix="$pkgdir/usr/share/licenses/$pkgname"
    mkdir -p "$license_prefix"
    cp "$srcdir/$_name/LICENSE" "$license_prefix"

    cd "$srcdir/${_name}"
    make PREFIX="/usr" DESTDIR="$pkgdir" install
    make PREFIX="/usr" BASHRC="$pkgdir/usr/share/shortbashpwd/bashrc.bash" bashrc
}

# vim:et
