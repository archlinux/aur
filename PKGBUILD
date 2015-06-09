# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=slapi-nis
pkgver=0.54
pkgrel=1
pkgdesc="NIS Server and Schema Compatibility plugins for Directory Server"
arch=(i686 x86_64)
url="http://slapi-nis.fedorahosted.org/"
license=(GPL)
depends=(389-ds-base libtirpc nspr nss openldap tcp_wrappers)
options=(!libtool)
source=("https://fedorahosted.org/releases/s/l/slapi-nis/slapi-nis-${pkgver}.tar.gz")
sha512sums=('4afd1f19b8c2c958200e4916044a514abf0ecd237766d501840dcbf913d753214eef90014069d2bd61cbc1fd07f7b000af64a512ead046d47e7dc8e9a2e28753')

build() {
  cd "${pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --disable-static \
    --with-tcp-wrappers \
    --with-ldap=openldap

  make
}

check() {
  cd "${pkgname}-${pkgver}"
  # 389 needs to be running for this to work
  #make check
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}
