# Maintainer: Ewout van Mansom <ewout@vanmansom.name>
# Contributor: Iwan Timmer <irtimmer@gmail.com>

pkgname=ddcci-driver-linux-dkms
pkgver=0.4.3
_pkgver=0.4.2
pkgrel=1
pkgdesc="A pair of Linux kernel drivers for DDC/CI monitors (DKMS)"
arch=('i686' 'x86_64' 'aarch64')
url="https://gitlab.com/ddcci-driver-linux/ddcci-driver-linux/"
license=('GPL2')
depends=('dkms')
conflicts=("ddcci-driver-linux")
source=(
  "https://gitlab.com/ddcci-driver-linux/ddcci-driver-linux/-/archive/v${_pkgver}/ddcci-driver-linux-v${_pkgver}.tar.gz"
  "linux-6.1-fix.patch::https://gitlab.com/ddcci-driver-linux/ddcci-driver-linux/-/merge_requests/10.patch"
)
b2sums=('b21e02c964579f194026bc9f6cb687ea07ad91f55806d7af685813d4ee144b5495b1ad27a00e83be6a87248be195b680b14fad08cf9cfc1351f4070a69e92d6f'
        'c03c758ce9fc469bfb8f7228831ed8fd4ec03f503acb64d2d8b37de0196379a113aa79f63bee12875d8c24dba460a037e1762d0050afa9fd8fdffd0d7227f599')

prepare() {
    cd "ddcci-driver-linux-v${_pkgver}"
    patch --forward --strip=1 --input="${srcdir}/linux-6.1-fix.patch"
}

package() {
  local destdir="${pkgdir}/usr/src/ddcci-${pkgver}"

  install -d "${destdir}"
  cp -rT "ddcci-driver-linux-v${_pkgver}" "${destdir}"
}
