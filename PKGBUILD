# Maintainer: Deon Spengler <deon@spengler.co.za>
# Contributor:  DJ Lucas <dj_AT_linuxfromscratch_DOT_org>
# Contributor: Steven Hiscocks <steven [at] hiscocks [dot] me [dot] uk>
# Contributor: Andre Wayand <aur-sope@awayand.sleepmail.com>
pkgname=sope
pkgdesc="application server used by SOGo"
pkgver=5.8.2
pkgrel=1
arch=(x86_64)
url="http://www.sogo.nu/files/downloads/SOGo/Sources/"
license=('GPL')
options=('!strip')
replaces=('sope2')
depends=('gnustep-base')
makedepends=('gcc-objc'
             'gnustep-make'
             'libxml2'
             'libmariadbclient'
             'libldap'
             'openssl'
             'postgresql-libs')
optdepends=('libxml2: parse XML coniguration files'
            'mariadb: run database server for sogo locally'
            'openldap: run directory server for sogo locally'
            'openssl: create SSL secured connectons'
            'postgresql: run database server for sogo locally')
source=("https://packages.sogo.nu/sources/SOPE-${pkgver}.tar.gz")
sha512sums=('c6167754401a50b71527f34a38081332253496baa792b77275d3f0163c407d46926d9b0ba51022ab97fd5eb855a86bf11065ce1a7370c7c5bd246a2b7e0f8dc3')

prepare() {
  cd SOPE
  sed 's@NSBIG5StringEncoding@NSBig5StringEncoding@g' -i sope-mime/NGMime/NGMimeType.m
  sed 's@NSGB2312StringEncoding@NSHZ_GB_2312StringEncoding@g' -i sope-mime/NGMime/NGMimeType.m
}

build() {
  cd SOPE
  ./configure --with-gnustep --disable-strip --disable-debug
  make
}

package() {
  cd SOPE
  make install DESTDIR="${pkgdir}"
}
