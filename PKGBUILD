# Maintainer: envolution
# Contributor: Christian Hesse <mail@eworm.de>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=libreport
pkgver=2.17.15
pkgrel=3
pkgdesc='Generic library for reporting various problems'
arch=('i686' 'x86_64')
depends=(
'python-urllib3' 
'python-requests' 
'satyr' 
'augeas' 
'libtar' 
'libffi' 
'libnewt' 
'gtk3' 
'xmlto' 
'libxmlrpc>=1:1.59.03-3' 
'json-c' 
'harfbuzz'
'cairo'
'pango'
'glibc'
'at-spi2-core'
'curl'
'libarchive'
'libxmlrpc'
'libxml2'
'zlib'
'xz'
'gcc-libs'
'glib2'
'icu'
'gdk-pixbuf2'
'systemd-libs'
'nss')
makedepends=(
'intltool' 
'asciidoc' 
'gdk-pixbuf2'
'python')
optdepends=('python: python 3.x bindings')
url='https://github.com/abrt/libreport'
license=('GPL-2.0-only')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/abrt/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('cf181ed248f6bf12233b459e4a504fab645b3ce8040b6855a073453756311166')

prepare() {
  cd "${pkgname}-${pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr
}

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
  install -Dm644 COPYING -t ${pkgdir}/usr/share/licenses/${pkgname}
}

# vim:set ts=2 sw=2 et:
