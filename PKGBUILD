# Contributor: Jonathan Liu <net147@gmail.com>
pkgname=ftpproxy
pkgver=1.2.3
pkgrel=1
pkgdesc="FTP proxy with optional access and command control and client monitoring"
arch=('i686' 'x86_64')
url="http://www.ftpproxy.org/"
license=('GPL2')
depends=('glibc')
backup=('etc/xinet.d/ftpproxy')
source=("http://www.ftpproxy.org/download/${pkgname}-${pkgver}.tgz"
        "ftpproxy.xinetd")
md5sums=('c2068bc452e1d7554d3bda08030aa433'
         '701382c974b7e4965123444038ec1897')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make || return 1
  install -D -m755 src/ftp.proxy "${pkgdir}/usr/sbin/ftp.proxy" || return 1
  install -D -m644 doc/ftp.proxy.1 "${pkgdir}/usr/share/man/man1/ftp.proxy.1" || return 1
  install -D -m644 "${srcdir}/ftpproxy.xinetd" "${pkgdir}/etc/xinetd.d/ftpproxy"
}

# vim:set ts=2 sw=2 et:
