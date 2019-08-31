# Maintainer: Mitsuru Takigahira <mysticdoll@mysticdoll.com>
pkgname=hypervfcopyd
pkgver=4.10.1
pkgrel=1
pkgdesc="Hyper-V File Copy Daemon for Arch Linux"
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
        "hypervfcopyd.service"
       )
install=''
md5sums=('SKIP'
         'SKIP'
        )

prepare() {
  tar xvf ${srcdir}/linux-${pkgver}.tar.gz linux-${pkgver}/tools/hv/hv_fcopy_daemon.c
}

build() {
  gcc ${srcdir}/linux-${pkgver}/tools/hv/hv_fcopy_daemon.c -o ${srcdir}/hypervfcopyd
}

package() {
  install -Dm 755 ${srcdir}/hypervfcopyd ${pkgdir}/usr/local/bin/hypervfcopyd
  install -Dm 755 ${srcdir}/hypervfcopyd.service ${pkgdir}/usr/lib/systemd/system/hypervfcopyd.service
}
