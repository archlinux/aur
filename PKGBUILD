# Maintainer: tinywrkb <tinywrkb@gmail.com>
# Contributor: Eric Bélanger <eric@archlinux.org>

_pkgname=inetutils
pkgname=${_pkgname}-hostname
pkgver=2.0
pkgrel=1
pkgdesc="inetutils without the anachronistic nonsense, just hostname to please silly code"
url="https://www.gnu.org/software/inetutils/"
license=('GPL3')
source=("https://ftp.gnu.org/gnu/inetutils/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('b45fdf42d0995f8a86d922d56ba9900cff60a98012e3d94965493cb892593648')
arch=('x86_64')
makedepends=('help2man')
conflicts=(${_pkgname})
provides=(${_pkgname})

build() {
  cd ${_pkgname}-${pkgver}
  ./configure \
    --prefix=/usr \
    --libexec=/usr/bin \
    --localstatedir=/var \
    --sysconfdir=/etc \
    --without-{wrap,pam} \
    --disable-{dnsdomainname,ftp,ftpd,ifconfig,inetd,logger,ping,ping6} \
    --disable-{rcp,rexec,rexecd,rlogin,rlogind,rsh,rshd,syslogd} \
    --disable-{talk,talkd,telnet,telnetd,tftp,tftpd,traceroute,uucpd,whois} \
    --enable-hostname
  make
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/share/info
}
