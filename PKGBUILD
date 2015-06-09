# Maintainer: Javier Torres <javitonino [at] gmail [dot] com>

pkgname=softhsm
pkgver=1.3.7
pkgrel=3
pkgdesc="Software PKCS11 store"
arch=('i686' 'x86_64')
url="http://www.opendnssec.org/softhsm/"
license=('BSD')
groups=()
depends=('botan-1.10' 'sqlite3>=3.3.9')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=("etc/softhsm.conf")
options=(!libtool)
install=
changelog=
source=("http://www.opendnssec.org/files/source/${pkgname}-${pkgver}.tar.gz")
noextract=()

md5sums=('acfda39ee23c32f38ee51692d6c6a44b')                                                                                                                 
sha1sums=('e8bf4269472f9e63d1dfeda238b1d542d6c036f2')                                                                                                        
sha256sums=('d12d6456a85561266d9da427565f3ee3746a35df6670d5e6be75de253c2810a4')                                                                              
sha384sums=('a0c8541efe1443f4c98c83be4c86265f1e40c112c5bf4ae5b98a358d858b7a392c39938ad8f6a8f4d4a103742ddbc913')                                              
sha512sums=('287400b981b7b420a300593129696e4739afe085a8106047ef429bc741d205bed214386b422572327c3bda63f0fb1b7558bb4d30d184ca3ec2ba9900153f075d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # /usr/lib/softhsm -> /usr/bin (no subdirectory)
  sed -i \
  -e "s/full_libdir=\"\$full_libdir\/softhsm\"/#full_libdir=\"\$full_libdir\/softhsm\"/" \
  -e "s/libdir=\$full_libdir/#libdir=\$full_libdir/" \
  configure

  ./configure --prefix=/usr --datarootdir=/usr/share --localstatedir=/var --sysconfdir=/etc --with-botan=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}/" install
  install -Dm0644 "LICENSE" \
        "${pkgdir}/usr/share/licenses/softhsm/LICENSE"
}
