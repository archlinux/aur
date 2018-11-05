# Maintainer  : George Angelopoulos <george@usermod.net>
# Contributor : Christian Rebischke <Chris.Rebischke@archlinux.org>
# Contributor : dront78 <dront78@gmail.com>
pkgname=systemtap
pkgver=4.0
pkgrel=1
pkgdesc="provides infrastructure to simplify the gathering of information about the running system."
url="http://sourceware.org/systemtap/"
arch=('x86_64' 'i686')
license=('GPL')
depends=('elfutils' 'nss' 'python2')
makedepends=('python2-setuptools' 'xmlto')
optdepends=('sqlite3: for storing results in a database')
source=("${pkgname}-${pkgver}.tar.gz::https://sourceware.org/systemtap/ftp/releases/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.asc::https://sourceware.org/systemtap/ftp/releases/${pkgname}-${pkgver}.tar.gz.asc"
        )
sha512sums=('66b5ba1902ed974101429dce9fee849273d3dc64e862c057177d158c5f284cc93299819ee8ee49d4bd3b7ff47a3512b1c68b74cad374147ce67fa406c7518c79'
            'SKIP')
install='systemtap.install'
validpgpkeys=('5D38116FA4D3A7CC77E378D37E83610126DCC2E8')


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
}

