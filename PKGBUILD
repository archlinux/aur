# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Timm Preetz <timm@preetz.us>

pkgname=vala0.12
pkgver=0.12.1
pkgrel=2
pkgdesc="Compiler for the GObject type system - version 0.12"
arch=('x86_64')
url="http://live.gnome.org/Vala"
license=('LGPL')
depends=('glib2')
makedepends=('gobject-introspection' 'libxslt' 'dbus')
checkdepends=('libx11')
options=('!libtool')
source=("http://ftp.gnome.org/pub/gnome/sources/vala/${pkgver%.*}/vala-${pkgver}.tar.xz")
sha256sums=('f102bb64549ebe88955bb9fa0f502d974413aec71fec88e3544c65adfeb0afb4')

build() {
  cd "vala-${pkgver}"
  ./configure --prefix=/usr --enable-vapigen
  make
}

check() {
  cd "vala-${pkgver}"
  make check
}

package() {
  cd "vala-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # Remove conflicting files with the vala package
  rm -rv "${pkgdir}/usr/share/aclocal"
  for _file in vala valac vala-gen-introspect vapicheck vapigen
  do
    rm -v "${pkgdir}/usr/bin/${_file}"
  done
  for _file in valac.1 vala-gen-introspect.1 vapigen.1
  do
    rm -v "${pkgdir}/usr/share/man/man1/${_file}"
  done
}

