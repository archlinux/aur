# Maintainer: Jameson Pugh <imntreal@gmail.com>
# Contributor: Det <nimetonmaili g-mail>
# Contributor: Sergio A. Morales <sergiomorales@archlinux.cl>

pkgname=389-admin
pkgver=1.1.46
pkgrel=4
pkgdesc="389 Administration Server HTTP agent"
arch=('i686' 'x86_64')
url="http://directory.fedoraproject.org/"
license=('GPL')
depends=('389-adminutil' 'mod_nss')
source=("https://fedorapeople.org/groups/389ds/binaries/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('6e1da6f8494bc6693cb50f77db448e3c3aa7cd96470f92ef95ed4b784e7b58fe')

build() {
  cd "${pkgname}-${pkgver}"
  
  [ "${CARCH}" == "x86_64" ] && export USE_64=1

  msg2 "Running configure..."
  ./configure --disable-rpath \
              --prefix=/usr \
              --sysconfdir=/etc \
	            --sbindir=/usr/bin \
              --with-systemd \
              --with-systemdsystemunitdir=/usr/lib/systemd/system \
              --with-systemdsystemconfdir=/etc/systemd/system \
	            --with-openldap \
              --with-adminutil=/usr

  msg2 "Running make..."
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  
  msg2 "Running make install..."
  make install DESTDIR="${pkgdir}"

  #rm -rf "${pkgdir}/etc/rc.d"
  #mkdir -p "${pkgdir}/usr/lib/systemd/system"
  #cp -f "${srcdir}/dirsrv-admin.service" "${pkgdir}/usr/lib/systemd/system/"
}

# vim:set ts=2 sw=2 et:
