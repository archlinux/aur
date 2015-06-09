# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Jan Alexander Steffens <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=libgnome-control-center
pkgver=3.16.0
pkgrel=1
pkgdesc='The Control Center for GNOME - shared library'
license=('GPL')
arch=('i686' 'x86_64')
depends=("gnome-control-center=${pkgver}")
makedepends=('gnome-doc-utils' 'intltool' 'docbook-xsl' 'gnome-common' 'modemmanager')
groups=('gnome')
url='http://www.gnome.org'
options=('!emptydirs')
source=("http://download.gnome.org/sources/gnome-control-center/${pkgver:0:4}/gnome-control-center-${pkgver}.tar.xz"
        'revert-drop-library.patch')
sha256sums=('d2ca9ef8619fee91f2b54c0b8461185ecbcb003916f5ff077ddc3f97232d3b12'
            '80c964ecef5abf230fa274bb39fdff22c0f75cd082ad393211b3933a1bfa43b4')

prepare() {
  cd gnome-control-center-${pkgver}

  patch -Np1 -i ../revert-drop-library.patch
}

build() {
  cd gnome-control-center-${pkgver}

  export ACLOCAL='/usr/bin/aclocal'
  export AUTOMAKE='/usr/bin/automake'
  ./configure \
    --prefix='/usr' \
    --localstatedir='/var' \
    --libexecdir='/usr/lib/gnome-control-center' \
    --sysconfdir='/etc' \
    --disable-silent-rules \
    --disable-static
  make -j1
}

package() {
  cd gnome-control-center-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,lib/gnome-control-center,share}
}

# vim: ts=2 sw=2 et:
