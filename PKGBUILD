# Based on upstream PKGBUILD
# https://github.com/nowrep/dualsensectl/blob/main/dist/PKGBUILD

_pkgbase=dualsensectl
pkgbase=${_pkgbase}-git
pkgname=dualsensectl-git
pkgdesc='Tool for controlling PS5 DualSense controller'
conflicts=('dualsensectl')
pkgver=r10.dfaaa89
pkgrel=1
url='https://github.com/nowrep/dualsensectl'
license=('GPL2')
arch=('x86_64')
depends=('dbus' 'hidapi')
makedepends=('git' 'gcc')
source=("$_pkgbase::git+$url")
sha512sums=('SKIP')

pkgver() {
    cd "$_pkgbase"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    make -C "$_pkgbase"
}

package() {
    make -C "$_pkgbase" DESTDIR="$pkgdir" install
}
