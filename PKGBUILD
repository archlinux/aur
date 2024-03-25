# Maintainer: Rolv Apneseth <rolv.apneseth@gmail.com>

pkgname=rofi-calc-git
_pkgname=rofi-calc
pkgver=r181.12fe2d5
pkgrel=2
pkgdesc='Do calculations in rofi'
url='https://github.com/svenstaro/rofi-calc'
arch=('x86_64')
license=('MIT')
depends=('rofi' 'libqalculate')
checkdepends=('check')
makedepends=("git" "autoconf" "automake" "libtool")
conflicts=("$_pkgname")
provides=("$_pkgname")
source=("git+https://github.com/svenstaro/${_pkgname}")
b2sums=('SKIP')

pkgver()
{
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
    cd "$_pkgname"
    autoreconf -i
    ./configure --prefix=/usr
    make
}

package()
{
    cd "$_pkgname"
    make DESTDIR="${pkgdir}/" install
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
