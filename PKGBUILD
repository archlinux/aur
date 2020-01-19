#! /bin/bash
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Johan Slikkie <johan@slikkie.nl>
# Maintainer: jorge_barroso <jorge.barroso.11@gmail.com> 

pkgname=abraca
_pkgname=Abraca
pkgver=0.8.2
pkgrel=1
pkgdesc="A GTK3 client for the XMMS2 music player, with a focus on collections"
arch=('x86_64' 'i686')
url="http://abraca.github.com/Abraca/"
license=('GPL')
depends=('gtk3' 'xmms2' 'libgee' 'waf')
makedepends=('scons' 'vala>=0.18.0' 'python2' 'gettext' 'python<=3.7')
install=abraca.install
sha512sums=('69facf0ebeca29fdff8d03b2fd5255c9344536a00d5993b42fa4b25eae8b67576e2cdfaa81a1cd025a7efc01404b9cab091e1bb9314e7691b6fd0ad883ae497d'
            '7c3f395093212fd05dad4066f197d03ea1a0231b6de0e136268360a5b27829ab32b3ff0b9c0eef63ce424da31175a11329dedc81d8e40e56ede116542faa373c')
source=("https://github.com/$_pkgname/$_pkgname/archive/${pkgver}.tar.gz"
	"https://github.com/$_pkgname/$_pkgname/pull/33.patch")

prepare() {
  cd "$srcdir"/${_pkgname}-${pkgver}
  patch -p1 < ../33.patch
}  

build() {

  cd "$srcdir"/${_pkgname}-${pkgver}
  
  waf configure --prefix=/usr
  waf build
}

package() {
  waf install
}

# vim:set ts=2 sw=2 et:
