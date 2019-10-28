# Maintainer: An Nguyen (stk) <an@linux.com>
# Original Maintainer: George Angelopoulos <george@usermod.net>
# Original Maintainer: Christian Rebischke <Chris.Rebischke@archlinux.org>
# Original Maintainer: dront78 <dront78@gmail.com>
pkgname=systemtap
pkgver=4.1
pkgrel=1
pkgdesc="Infrastructure to simplify the gathering of information about the running Linux system"
url="http://sourceware.org/systemtap/"
arch=('x86_64' 'i686')
license=('GPL')
depends=('elfutils' 'nss' 'python2' 'cpio')
makedepends=('python2-setuptools' 'xmlto')
optdepends=('sqlite3: for storing results in a database')
source=("${pkgname}-${pkgver}.tar.gz::https://sourceware.org/systemtap/ftp/releases/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.asc::https://sourceware.org/systemtap/ftp/releases/${pkgname}-${pkgver}.tar.gz.asc"
        )
sha512sums=('fbd606d9842ac63af6e607613a112b08d7593da74ad0398716cdc46f74a977a8e6b9fae92e1f63779ccfc94cffa25f29dee2ae44f67ecc4cedae630e50a2e7b6'
            '755a11b6024bb15c6415532352fd62a824266edeb5ab3e1ef6cfa31259f8bf7d9a92fcf7476c307cd7d4188ff20cefe86558b2a6e4c099987e1041bd1f98031e')
install='systemtap.install'
validpgpkeys=('F75E6545B9F8AA15AA932A444DE16D68FDBFFFB8')  # "Serhei Makarov (for Red Hat 2018..onwards) <smakarov@redhat.com>" 

build() {
  cd "${pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/"${pkgname}" \
    --libdir=/usr/lib/"${pkgname}" \
    --mandir=/usr/share/man/ \
    --sbindir=/usr/bin \
    --localstatedir=/var \
    --enable-pie \
    --disable-docs \
    --enable-htmldocs
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rmdir "${pkgdir}/var/run/stap-server/"
  rmdir "${pkgdir}/var/run/"
  rm -r "${pkgdir}/usr/include"
}
