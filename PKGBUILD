# Maintainer: Toke Høiland-Jørgensen <toke@toke.dk>
pkgname=mahimahi-git
_pkgname=mahimahi
pkgver=r587.3fba966
pkgrel=1
pkgdesc="Web performance measurement toolkit"
url="https://github.com/keithw/mahimahi"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('apache' 'protobuf' 'dnsmasq' 'iptables' 'pango')
makedepends=('automake')
source=("git+https://github.com/keithw/mahimahi.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  sed -i -e '/AC_CHECK_FILE(\[\/etc\/ssl\/certs\/ssl-cert-snakeoil.pem\]/d' -e '/AC_MSG_ERROR(\[ssl/d' configure.ac
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
