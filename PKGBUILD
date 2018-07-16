# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: jtts <jussaar@mbnet.fi>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: Janax <janax99@yahoo.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=lib32-pam
pkgver=1.3.1
pkgrel=1
pkgdesc='Pluggable Authentication Modules'
arch=('x86_64')
url='http://linux-pam.org'
license=('GPL2')
depends=('lib32-cracklib' 'lib32-libnsl' 'lib32-libtirpc' 'pam')
makedepends=('docbook-xml' 'docbook-xsl' 'git' 'lib32-flex' 'w3m')
source=("git+https://github.com/linux-pam/linux-pam.git#tag=v${pkgver}")
sha256sums=('SKIP')
options=('!emptydirs')

build() {
  cd linux-pam

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./autogen.sh
  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32' \
    --sbindir='/usr/bin' \
    --disable-db
  make
}

package() {
  cd linux-pam

  make DESTDIR="${pkgdir}" SCONFIGDIR='/etc/security' install
  rm -rf "${pkgdir}"/{etc,usr/{include,share,bin}}
}

# vim: ts=2 sw=2 et:
