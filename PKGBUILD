# Maintainer: Mitsuru Takigahira <mysticdoll@mysticdoll.com>
pkgname=hypervvssd
pkgver=4.10.1
pkgrel=1
pkgdesc="Hyper-V VSS Daemon for Arch Linux"
url='https://www.kernel.org'
arch=('x86_64')
license=('GPLv3')
depends=()
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
source=("https://www.kernel.org/pub/linux/kernel/v${pkgver:0:1}.x/linux-${pkgver}.tar.gz"
        "hypervvssd.service"
       )
install=''
md5sums=('SKIP'
         'SKIP'
        )

prepare() {
  tar xvf ${srcdir}/linux-${pkgver}.tar.gz linux-${pkgver}/tools/hv/hv_vss_daemon.c
}

build() {
  gcc ${srcdir}/linux-${pkgver}/tools/hv/hv_vss_daemon.c -o ${srcdir}/hypervvssd
}

package() {
  install -Dm 755 ${srcdir}/hypervvssd ${pkgdir}/usr/local/bin/hypervvssd
  install -Dm 755 ${srcdir}/hypervvssd.service ${pkgdir}/usr/lib/systemd/system/hypervvssd.service
}
