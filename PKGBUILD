# Maintainer: Muflone <webreg(at)vbsimple.net>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Timm Preetz <timm@preetz.us>

pkgname=vala0.12
pkgver=0.12.1
pkgrel=1
pkgdesc="Compiler for the GObject type system - version 0.12"
arch=('i686' 'x86_64')
url="http://live.gnome.org/Vala"
license=('LGPL')
depends=('glib2')
makedepends=('gobject-introspection' 'libxslt')
checkdepends=('libx11')
options=('!libtool')
source=("http://ftp.gnome.org/pub/gnome/sources/vala/${pkgver%.*}/vala-${pkgver}.tar.xz")
sha512sums=('7f783aaf5b5a39f6d9d425a6c0ced10451454a7bc975c019dcbba83ea7c0cf381fc5647d3ac8dc5b3f94f611185ec7a30337c53ab68641513ba7c5bae31f7a0f')

build() {
  cd "${srcdir}/vala-${pkgver}"
  ./configure --prefix=/usr --enable-vapigen
  make
}

check() {
  cd "${srcdir}/vala-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/vala-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # Remove conflicting files with the vala package
  rm -rv "${pkgdir}/usr/share/aclocal"
  for file in vala valac vala-gen-introspect vapicheck vapigen
  do
    rm -v "${pkgdir}/usr/bin/$file"
  done
  for file in valac.1 vala-gen-introspect.1 vapigen.1
  do
    rm -v "${pkgdir}/usr/share/man/man1/$file"
  done
}

