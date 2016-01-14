# Maintainer: kurych <kurych[at]mail[dot]ru>
pkgname=wanproxy-git
_pkgname=wanproxy
pkgver=r1518.54406a1
pkgrel=1
pkgdesc="Portable TCP proxy which makes TCP connections send less data, which improves TCP performance and throughput over lossy links, slow links and long links"
arch=('i686' 'x86_64')
url="http://wanproxy.org/"
license=('BSD')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=('etc/wanproxy/wanproxy.conf' 'etc/conf.d/wanproxy')
source=("${_pkgname}::git+https://github.com/wanproxy/wanproxy.git"
        'wanproxy.conf.d'
        'wanproxy.service')
pkgver() {
      cd ${_pkgname}
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
##  cd "${srcdir}/${_pkgname}/"
##  patch -p0 -i ../linux.patch
  cd "${srcdir}/${_pkgname}/programs/wanproxy" 
  make NDEBUG=1
}

package() {
  install -D -m755 "${srcdir}/${_pkgname}/programs/wanproxy/wanproxy" "${pkgdir}/usr/bin/wanproxy"
  install -D -m644 "${srcdir}/${_pkgname}/programs/wanproxy/wanproxy.conf" "${pkgdir}/etc/wanproxy/wanproxy.conf"
  install -D -m644 "${srcdir}/wanproxy.conf.d" "${pkgdir}/etc/conf.d/wanproxy"
  install -Dm644 "${srcdir}/wanproxy.service" "${pkgdir}/usr/lib/systemd/system/wanproxy.service"
}

md5sums=('SKIP'
         'a3d57b2758b121b433fcbb6d4d4118b6'
         '04c8b8a251e4a74272d6029c2885c8b6')

# vim:set ts=2 sw=2 et:

