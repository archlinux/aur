# Author:     David Rosca <nowrep@gmail.com>

_pkgbase=dualsensectl
pkgbase=${_pkgbase}-git
pkgname=dualsensectl-git
pkgdesc='Tool for controlling PS5 DualSense controller'
conflicts=('dualsensectl')
pkgver=r55.9d596ab
pkgrel=1
url='https://github.com/nowrep/dualsensectl'
license=('GPL2')
arch=('x86_64')
depends=('dbus' 'hidapi')
makedepends=('git' 'gcc' 'meson')
source=("$_pkgbase::git+$url")
sha512sums=('SKIP')

pkgver() {
    cd "$_pkgbase"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgbase"
    arch-meson build
    meson compile -C build
}

package() {
    cd "$_pkgbase"
    meson install -C build --destdir "$pkgdir"
}
