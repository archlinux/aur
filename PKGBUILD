# Maintainer: Edgard Castro <castro@edgard.org>
# Contributor: Carl George < arch at cgtx dot us >
# Contributor: Tamás Barta < barta dot tamas dot d at gmail dot com >

pkgname=gnome-shell-extension-panel-osd-git
pkgver=r113.c33034a
pkgrel=1
pkgdesc='Place gnome-shell notifications under the panel instead of above the message-tray. (git version)'
arch=(any)
_githubname=gnome-shell-extension-panel-osd
_githubowner=jenslody
url="https://github.com/${_githubowner}/${_githubname}"
license=(GPL3)
depends=('gnome-shell')
makedepends=("gnome-common" "automake" "autoconf" "intltool" "pkg-config")
source=("git+https://github.com/${_githubowner}/${_githubname}.git")
sha256sums=('SKIP')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")


pkgver() {
    cd "${srcdir}/${_githubname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_githubname}"
    ./autogen.sh --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${_githubname}"
    make DESTDIR="$pkgdir" install
}
