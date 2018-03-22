# Maintainer: George Amanakis ( g_amanakis at yahoo dot com )
#
pkgname=sch_cake-dkms
_modname=sch_cake
pkgver=r428.0afc1be
pkgver() {
	cd "sch_cake"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc="The CAKE scheduler, bufferbloat.net"
arch=('i686' 'x86_64')
license=('GPL')
depends=('dkms')
optdepends=('linux-headers: build the module against Arch kernel [requires at least one set of kernel headers]'
            'linux-lts-headers: build the module against LTS Arch kernel [requires at least one set of kernel headers]')
provides=('sch_cake')
source=('git+https://github.com/dtaht/sch_cake.git#branch=cobalt'
	'dkms.conf.in')
url="bufferbloat.net"

package() {
  cd ${srcdir}/${_modname}
  install -dm755 "${pkgdir}/usr/src/${_modname}-${pkgver}/"
  for i in "${srcdir}/${_modname}/"{Makefile,*.c,*.h}; do
    install -D -m644 "${i}" "${pkgdir}/usr/src/${_modname}-${pkgver}/"
  done
  sed "s/#MODULE_VERSION#/${pkgver}/" "${srcdir}/dkms.conf.in" > "${pkgdir}/usr/src/${_modname}-${pkgver}/dkms.conf"
}

md5sums=('SKIP'
         '7a1c56002e8541836faf7d26be8920a5')
