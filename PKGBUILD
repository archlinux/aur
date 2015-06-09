# Maintainer: "UnCO" Lin <undercooled _at_ lavabit com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=advcopy
pkgver=0.5
_coreutils_pkgver=8.23
pkgrel=2
pkgdesc="Advanced Copy is a mod for the GNU cp and GNU mv tools which adds a progress bar and provides some info on what's going on."
arch=('i686' 'x86_64')
license=('GPL3')
url="http://beatex.org/web/advancedcopy.html"
install=${pkgname}.install
depends=('glibc' 'pam' 'acl' 'gmp' 'libcap')
source=(ftp://ftp.gnu.org/gnu/coreutils/coreutils-${_coreutils_pkgver}.tar.xz
        advcpmv-${pkgver}-${_coreutils_pkgver}.patch)
md5sums=('abed135279f87ad6762ce57ff6d89c41'
         'bf16a90c2c8398447e0a47421267563b')
build() {
  cd "${srcdir}"/coreutils-${_coreutils_pkgver}
  patch -p1 -i "${srcdir}"/advcpmv-${pkgver}-${_coreutils_pkgver}.patch
  ./configure --prefix=/usr --libexecdir=/usr/lib \
              --enable-no-install-program=groups,hostname,kill,uptime
  make
}

package() {
  cd "${srcdir}"/coreutils-${_coreutils_pkgver}
  install -Dm755 src/cp ${pkgdir}/usr/bin/vcp
  install -Dm755 src/mv ${pkgdir}/usr/bin/vmv
}
