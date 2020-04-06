# Maintainer: Nicolas Glassey <info@geeq.ch>
  
_pkgname=libnotify
pkgname=${_pkgname}-id
pkgver=0.7.9
pkgrel=1
pkgdesc="Desktop notification library"
arch=('i686' 'x86_64')
url="https://developer.gnome.org/notification-spec/"
license=(LGPL)
depends=(gdk-pixbuf2)
makedepends=(gtk3 gobject-introspection meson xmlto docbook-xsl gtk-doc)
conflicts=('libnotify' 'libnotify-git' 'libnotify-id-git')
provides=("libnotify=$pkgver")
source=("http://ftp.gnome.org/pub/GNOME/sources/${_pkgname}/0.7/${_pkgname}-${pkgver}.tar.xz"
        'https://launchpadlibrarian.net/105791133/print-and-replace-id-v3.patch')
sha256sums=('66c0517ed16df7af258e83208faaf5069727dfd66995c4bbc51c16954d674761'
            '88655522acb5a4c1634de368e91ae79b4a8f205288bf4451e82e007266ba4fcb')

prepare() {
        cd ${_pkgname}-${pkgver}
        patch -Np1 -i '../print-and-replace-id-v3.patch'
}

build() {
        arch-meson ${_pkgname}-${pkgver} build
        ninja -C build
}

check() {
        meson test -C build --print-errorlogs
}
package() {
        DESTDIR="$pkgdir" meson install -C build
}

