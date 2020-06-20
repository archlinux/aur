# Maintainer: Razer <razer[AT]neuf[DOT]fr>
pkgbasename=gnome-shell-extension-bubblemail
pkgname=${pkgbasename}-git
pkgver=1.1.r1
pkgrel=0
pkgdesc="Unread mail notification service: Gnome shell extension"
pkgfolder="bubblemail-gnome-shell"
provides=("${pkgbasename}")
conflicts=("${pkgbasename}")
arch=(any)
url="https://framagit.org/razer/bubblemail-gnome-shell/"
license=('GPL2')
makedepends=('meson')
depends=('dconf' 'gnome-shell' 'bubblemail-git')
source=("git+https://framagit.org/razer/bubblemail-gnome-shell.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgfolder}"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd ${srcdir}/${pkgfolder}
    meson -Dprefix=/usr _build
    ninja -C _build build
}

package() {
    cp -r ${srcdir}/${pkgfolder}/_build/_package/* ${pkgdir}
}
