# Maintainer: Yamada Hayao <hayao@fascode.net>

_pkgname="files"
pkgname="elementary-${_pkgname}"
pkgver="6.0.1"
pkgrel=1
pkgdesc="File browser designed for elementary OS"
arch=('i686' 'x86_64')
url="https://github.com/elementary/files"
license=('GPLv3')

source=("git+${url}.git#tag=${pkgver}")
sha1sums=('SKIP')

depends=("meson" "vala" "libcanberra" "libcloudproviders"  "dbus-glib" "gtk2" "libgee" 
         "libgit2-glib" "libgit2" "granite" "gtk3" "libhandy" "libnotify" "pango" "plank" "sqlite" "zeitgeist"
         "flatpak-builder")

# Not found libunity-dev

build() {
    cd "${srcdir}/${_pkgname}"
    meson build --prefix="/usr"

    cd "${srcdir}/${_pkgname}/build"
    ninja
}

package(){
    cd "${srcdir}/${_pkgname}/build"
    DESTDIR="${pkgdir}" ninja install
}
