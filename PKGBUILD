# Maintainer: Rolv Apneseth <rolv.apneseth@gmail.com>

pkgname=rofi-calc-git
_pkgname=rofi-calc
pkgver=r220.a613682
pkgrel=2
pkgdesc='Do calculations in rofi'
url='https://github.com/svenstaro/rofi-calc'
arch=('x86_64')
license=('MIT')
depends=('rofi' 'libqalculate')
checkdepends=('check')
makedepends=("git" "meson")
conflicts=("$_pkgname")
provides=("$_pkgname")
source=("git+https://github.com/svenstaro/${_pkgname}")
b2sums=('SKIP')
options=(!debug)

pkgver()
{
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
    arch-meson "$_pkgname" build
    meson compile -C build
}

package()
{
    meson install -C build --destdir "$pkgdir" --no-rebuild
    install -Dm 644 "$_pkgname/LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
