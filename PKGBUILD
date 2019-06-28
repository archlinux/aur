pkgname=spi-config-dkms
pkgver=20190628
pkgrel=2
pkgdesc="spi board configuration without having to recompile the kernel"
license=('GPL')
arch=('i686' 'x86_64')
depends=('dkms')
makedepends=('git')
optdepends=('linux-headers: build the module against Arch kernel'
            'linux-ck-headers: build the module against Linux-ck kernel'
            'linux-lts-headers: build the module against LTS Arch kernel')
url='https://github.com/msperl/spi-config'
source=("git+https://github.com/msperl/spi-config.git"
        'dkms.conf.in')
md5sums=('SKIP'
         '797b68e988862d7c10bb8cfb2eeaa5e8')

package() {
  cd ${srcdir}/spi-config
  install -dm755 "${pkgdir}/usr/src/spi-config-${pkgver}/"
  for i in "${srcdir}/spi-config/"{Makefile,*.c}; do
    install -D -m644 "${i}" "${pkgdir}/usr/src/spi-config-${pkgver}/"
  done
  sed "s/#MODULE_VERSION#/${pkgver}/" "${srcdir}/dkms.conf.in" > "${pkgdir}/usr/src/spi-config-${pkgver}/dkms.conf"
}
