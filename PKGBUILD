# Maintainer: robertfoster

_pkgname=gnome-multi-writer
pkgname=${_pkgname}-git
pkgver=3.35.90.g33decbc
pkgrel=1
pkgdesc="Write an ISO file to multiple USB devices at once"
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/Apps/MultiWriter"
license=('GPL2')
depends=('gtk3' 'libcanberra' 'libgusb' 'udisks2')
makedepends=('appstream-glib' 'docbook-sgml' 'docbook-utils' 'git' 'intltool' 'meson' 'perl-sgmls')
optdepends=('gnome-icon-theme-extras: show device icons')
replaces=("${_pkgname}")
conflicts=("${_pkgname}")
source=(${_pkgname}::git+https://git.gnome.org/browse/${_pkgname}/)
install=$_pkgname.install

build() {
    arch-meson ${_pkgname} build -D b_pie='false'
    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
}

pkgver() {
    cd $srcdir/${_pkgname}
    LVERSION=`git describe --long| sed "s/_/./g"`
    VERSION=`git describe --tag| sed "s/_/./g" | cut -c 20-`
    COMMIT=${LVERSION##*-}
    echo "$VERSION.$COMMIT"
}

md5sums=('SKIP')
