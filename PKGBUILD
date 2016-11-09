# Contributor: Rustam Tsurik <rustam.tsurik@gmail.com>
# Contributor: Nico Suarez <nicodoggie@gmail.com>

pkgname=galera
pkgver=25.3.19
pkgrel=1
pkgdesc='WSREP provider'
arch=('i686' 'x86_64' 'mips64el')
license=('GPL2' 'custom:OpenSSL Linking Exception')
depends=('openssl' 'asio')
makedepends=('boost>=1.58' 'check' 'scons')
url='http://www.codership.com'
options=('!libtool')
validpgpkeys=('44B7345738EBDE52594DAD80D669017EBC19DDBA') # Codership Oy <info@galeracluster.com>
source=("http://releases.galeracluster.com/source/${pkgname}-3-${pkgver}.tar.gz"{,.asc})
sha256sums=('76700900a95c8d16c5f5975e4cbc1e0b3dac1a7ffea1aff84d5d225137eedbdb' 'SKIP')

build(){
  cd "${pkgname}-3-${pkgver}"

  scons
}

package(){
  cd "${pkgname}-3-${pkgver}"

  install -Dm0644 libgalera_smm.so "${pkgdir}"/usr/lib/libgalera_smm.so
  install -Dm0755 garb/garbd "${pkgdir}"/usr/bin/garbd
  install -Dm0644 scripts/packages/README "${pkgdir}"/usr/share/doc/galera/README
  install -m0644 scripts/packages/README-MySQL "${pkgdir}"/usr/share/doc/galera/README-MySQL
  install -m0644 COPYING "${pkgdir}"/usr/share/doc/galera/COPYING
}

