# Maintainer: Deon Spengler <deon@spengler.co.za>
# Contributor:  DJ Lucas <dj_AT_linuxfromscratch_DOT_org>
# Contributor: Steven Hiscocks <steven [at] hiscocks [dot] me [dot] uk>
# Contributor: Andre Wayand <aur-sope@awayand.sleepmail.com>
pkgname=sope
pkgdesc="application server used by SOGo"
pkgver=5.11.0
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
sha512sums=('d25c668f3ce9cff94d151b09c6bd2734ff7fe3d31876edfa1f819e07867aa733bc0819e2f38013e909c787b14293cf8e0aba12f5cf1e1d52bd8ef8daaf6baff6')

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
