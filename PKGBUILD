# Contributor: Rustam Tsurik <rustam.tsurik@gmail.com>
# Contributor: Nico Suarez <nicodoggie@gmail.com>

pkgname=galera
pkgver=25.3.17
pkgrel=1
pkgdesc='WSREP provider'
arch=('i686' 'x86_64' 'mips64el')
license=('GPL2' 'custom:OpenSSL Linking Exception')
depends=('openssl')
makedepends=('boost>=1.58' 'check' 'scons')
url='http://www.codership.com'
options=('!libtool')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/codership/galera/archive/release_${pkgver}.tar.gz")
sha256sums=('344c8f79ad70ab2e29d464ee8a0c635ae73782132a08eee5656595b96b91e3ae')

build(){
  cd "${pkgname}-release_${pkgver}"
  scons
}

package(){
  cd "${pkgname}-release_${pkgver}"
  install -Dm0644 libgalera_smm.so "${pkgdir}"/usr/lib/libgalera_smm.so
  install -Dm0755 garb/garbd "${pkgdir}"/usr/bin/garbd
  install -Dm0644 scripts/packages/README "${pkgdir}"/usr/share/doc/galera/README
  install -m0644 scripts/packages/README-MySQL "${pkgdir}"/usr/share/doc/galera/README-MySQL
  install -m0644 COPYING "${pkgdir}"/usr/share/doc/galera/COPYING
}

