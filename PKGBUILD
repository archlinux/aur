# Contributor: Rustam Tsurik <rustam.tsurik@gmail.com>
# Contributor: Nico Suarez <nicodoggie@gmail.com>

pkgname=galera
pkgver=25.3.15
pkgrel=1
pkgdesc='WSREP provider'
arch=('i686' 'x86_64' 'mips64el')
license=('GPL2' 'custom:OpenSSL Linking Exception')
depends=('openssl')
makedepends=('boost>=1.58' 'check' 'scons')
url='http://www.codership.com'
options=('!libtool')
source=(https://github.com/codership/galera/archive/release_${pkgver}.tar.gz)

prepare() {
  cd "$pkgname-release_$pkgver"
  # makes build fail on 25.3.10
  # sed "s/-Werror//g" -i SConstruct
}

build(){
  cd "$pkgname-release_$pkgver"
  scons
}

package(){
  cd "$pkgname-release_$pkgver"
  install -Dm0644 libgalera_smm.so "$pkgdir"/usr/lib/libgalera_smm.so
  install -Dm0755 garb/garbd "$pkgdir"/usr/bin/garbd
  install -Dm0644 scripts/packages/README "$pkgdir"/usr/share/doc/galera/README
  install -m0644 scripts/packages/README-MySQL "$pkgdir"/usr/share/doc/galera/README-MySQL
  install -m0644 COPYING "$pkgdir"/usr/share/doc/galera/COPYING
}

sha512sums=('9c3152936e63ad1e8274423b7756129f3a65b3fa14b8c06b94ad58c0042bc9f476c49aa86a6577d741eea9ae919c2e1817d59cb3b9d7b21aef193712e32016c8')
