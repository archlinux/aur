# Userspace binary that manages MiSTer on the ARM side
# Maintainer: Alexandru M Stan <alex@hypertriangle.com>

# This package is repackaged from the files at
# https://github.com/MiSTer-devel/Main_MiSTer/tree/master/releases
# hence this is why it has a -bin suffix, as opposed to us compiling
# the releases ourselves.

buildarch=4

pkgname=mister-bin
pkgver=20220224
pkgrel=1
pkgdesc="Userspace binary that manages MiSTer on the ARM side, prebuilt"
arch=('armv7h')
provides=('mister')
conflicts=('mister')
url='https://github.com/MiSTer-devel/Main_MiSTer/'
license=('GPL')
depends=("imlib2" "bluez-libs")
optdepends=('linux-mister: MiSTer userspace probably needs custom kernel drivers'
            'mister-menu: MiSTer needs an FPGA core to talk to')
source=("https://github.com/MiSTer-devel/Main_MiSTer/raw/master/releases/MiSTer_${pkgver}"
        'mister-bin.install'
        'MiSTer.service')
sha256sums=('b910469bfebbc894c0f0672b75afbe761efefde297c5d5ea05df940a40a27d10'
            'cab7d3dfc8b0fd15deaef00dd5931b66da3a59e721fba6f957de7f4a915b8c98'
            '6f9a9a14420078c5fc5afeab364aba4a0be55992e95b897b913ed76e4fbe2971')

package_mister-bin() {
  install=mister-bin.install

  install MiSTer_${pkgver} -m744 -D "${pkgdir}"/usr/bin/MiSTer
  install MiSTer.service -Dt "${pkgdir}"/usr/lib/systemd/system

  mkdir -p "${pkgdir}"/media/fat

  # TODO: add MiSTer.ini?
}
