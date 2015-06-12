pkgname=redis-dns-git
_pkgname=redis-dns
pkgver=0.1.2
pkgrel=1
pkgdesc="A gevent redis based DNS server with dyndns like API (forked from https://github.com/coagentpai/redis-dns)"
url="https://github.com/rains31/redis-dns"
license=('GPL2')
depends=('redis' 'python2-daemon' 'python2-dnspython' 'python2-gevent' 'python2-redis')
makedepends=('git')
provides=(${_pkgname})
conflicts=(${_pkgname})
options=()
arch=('i686' 'x86_64')
source=("git+https://github.com/rains31/${_pkgname}.git")
sha1sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --tags | sed 's/^v//;s/-/./g'
}


package() {
  cd "${_pkgname}"
  #make DESTDIR="$pkgdir" install
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/lib/${_pkgname}"
  ln -s ../lib/${_pkgname}/${_pkgname}  "${pkgdir}/usr/bin/"
  install -D -m755 "${srcdir}/${_pkgname}/${_pkgname}" "${pkgdir}/usr/lib/${_pkgname}"
  install -D -m644 ${srcdir}/${_pkgname}/*.py "${pkgdir}/usr/lib/${_pkgname}"
  install -D -m644 "${srcdir}/${_pkgname}/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
} 
