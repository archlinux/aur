# Maintainer: Mitsuru Takigahira <mysticdoll@mysticdoll.com>
pkgname=hypervkvpd
pkgver=4.10.1
pkgrel=1
pkgdesc="Hyper-V KVP Daemon for Arch Linux"
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
        "hypervkvpd.service"
       )
install=''
md5sums=('SKIP'
         'SKIP'
        )

prepare() {
  tar xvf ${srcdir}/linux-${pkgver}.tar.gz linux-${pkgver}/tools/hv/hv_kvp_daemon.c
}

build() {
  gcc ${srcdir}/linux-${pkgver}/tools/hv/hv_kvp_daemon.c -o ${srcdir}/hypervkvpd
}

package() {
  install -Dm 755 ${srcdir}/hypervkvpd ${pkgdir}/usr/local/bin/hypervkvpd
  install -Dm 755 ${srcdir}/hypervkvpd.service ${pkgdir}/usr/lib/systemd/system/hypervkvpd.service
}
