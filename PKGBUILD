# Maintainer: Alexey Korop <akorop@ukr.net>
# Contributor: Martin Wimpress <code@flexion.org>

_pkgname=conky-manager2
pkgname=${_pkgname}-git
pkgver=2.7
pkgrel=1
pkgdesc="Fork of GUI for managing Conky widgets. Support added for latest conky config version - git"
arch=('x86_64')
license=('GPL3')
url="https://github.com/zcot/conky-manager2"
depends=('cairo' 'conky' 'desktop-file-utils' 'gtk3' 'imagemagick' 'json-glib' 'libgee' 'p7zip' 'rsync')
makedepends=('vala')
provides=('conky-manager2')
source=("${pkgname}"::"git+https://github.com/zcot/${_pkgname}.git"
        "conky-manager2-git.install"
        "perm.patch")
sha1sums=('SKIP'
          'f561b7f63b83f98b83f06e7434b6720ff0235e68'
          'af12b08779ecc33c514d8ccf4b270d277c56109c')
install=${pkgname}.install

pkgver() {
  cd "${srcdir}/${pkgname}"
  grep "AppVersion =" src/Main.vala | cut -d \" -f 2-2
}

prepare() {
  cd ${pkgname}
  patch -Np0 < "../perm.patch"
}

build() {
    cd "${srcdir}/${pkgname}"
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    make DESTDIR="${pkgdir}" install
}
