pkgname=fl2000-dkms
pkgver=r16.92da04a
pkgver() {
	cd "$srcdir/FL2000"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc="Fresco Logic FL2000 USB to VGA adapter driver"
license=('GPL')
arch=('i686' 'x86_64')
depends=('dkms')
makedepends=('git')
optdepends=('linux-headers: build the module against Arch kernel'
            'linux-ck-headers: build the module against Linux-ck kernel'
            'linux-lts-headers: build the module against LTS Arch kernel')
url='https://github.com/FrescoLogic/FL2000'
source=("git+https://github.com/FrescoLogic/FL2000.git"
        'dkms.conf.in')
md5sums=('SKIP'
         'b62bd690d716ddce06091899ce5259fa')

package() {
  cd ${srcdir}/FL2000
  install -dm755 "${pkgdir}/usr/src/fl2000-${pkgver}/"
  cp -a "${srcdir}"/FL2000/src/* "${pkgdir}"/usr/src/fl2000-${pkgver}/
  sed "s/#MODULE_VERSION#/${pkgver}/" "${srcdir}/dkms.conf.in" > "${pkgdir}/usr/src/fl2000-${pkgver}/dkms.conf"
}
