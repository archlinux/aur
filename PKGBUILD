# Maintainer: Dirk Möbius <dimoebius@gmail.com>
pkgname=icc-brightness-gnome-git
pkgver=r14.587a861
pkgrel=2
pkgdesc="Adjust OLED display brightness by applying ICC color profiles (GNOME version)"
arch=("x86_64")
url="https://github.com/udifuchs/icc-brightness.git"
license=('MIT')
depends=('python3' 'lcms2' 'gnome-color-manager')
makedepends=('make' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("git+https://github.com/udifuchs/icc-brightness.git")
noextract=()
sha1sums=('SKIP')

pkgver() {
    cd $srcdir/icc-brightness
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd icc-brightness
    make
}

package() {
    cd icc-brightness
    mkdir -p $pkgdir/usr/bin
    install ./icc-brightness-gen $pkgdir/usr/bin/
    install ./icc-brightness $pkgdir/usr/bin/
    mkdir -p $pkgdir/etc/xdg/autostart/
    install ./icc-brightness.desktop $pkgdir/etc/xdg/autostart/
    mkdir -p $pkgdir/usr/share/licenses/icc-brightness-gnome-git
    install ./LICENSE $pkgdir/usr/share/licenses/icc-brightness-gnome-git/
}

