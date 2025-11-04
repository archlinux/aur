# Maintainer: Deon Spengler <deon@spengler.co.za>
# Contributor:  DJ Lucas <dj_AT_linuxfromscratch_DOT_org>
# Contributor: Steven Hiscocks <steven [at] hiscocks [dot] me [dot] uk>
# Contributor: Andre Wayand <aur-sope@awayand.sleepmail.com>
pkgname=sope
pkgdesc="application server used by SOGo"
pkgver=5.12.4
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
sha512sums=('caca3bdc1b666be8a780a6a802239319c8992545388f00bb91a3b4e56720f2949b9c43ed55fb5b1186e3f29f96b8a4f5ce8b805e67d26da92f2f271d2b248558')

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
