# Maintainer: GordonGR <ntheo1979@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>  
# Contributor: djgera
# Contributor: Patrick Melo <patrick@patrickmelo.eti.br>

pkgname=geany-plugins-gtk3
_pkgname=geany-plugins
pkgver=1.25
pkgrel=1
pkgdesc='Plugins for Geany'
arch=('x86_64' 'i686')
url='http://plugins.geany.org/'
license=('GPL')
depends=("geany-gtk3>=$pkgver" 'gtkspell3' 'webkitgtk' 'ctpl' 'gpgme' 'vte'
         'desktop-file-utils' 'gtk-update-icon-cache' 'lua51' 'libgit2')
makedepends=('intltool' 'vala' 'gdb' 'cppcheck' 'libgit2')
optdepends=('hspell: hebrew spell checker')
provides=geany-plugins
conflicts=geany-plugins
install="${_pkgname}.install"
source=("http://plugins.geany.org/${_pkgname}/${_pkgname}-$pkgver.tar.bz2"
        'libgit2-0.23.patch')
sha256sums=('5c13ac1e173284462248ed2faae389a72364c5aa1538de628d2aaa7d286e244b'
            '2af198f08efd247f9c6cfa94e8d9836dbb1d6e3c74fbad8decba0c051c1473db')

prepare() {
  cd "${_pkgname}-$pkgver"
  patch -p1 -i ../libgit2-0.23.patch
}

build() {
  cd "${_pkgname}-$pkgver"

  ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib \
    --enable-gkt3
  make 
}

package() {
  make -C "${_pkgname}-$pkgver" DESTDIR="$pkgdir" install
}

