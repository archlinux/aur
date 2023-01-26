# Maintainer: Ewout van Mansom <ewout@vanmansom.name>
# Contributor: Iwan Timmer <irtimmer@gmail.com>

pkgname=ddcci-driver-linux-dkms
pkgver=0.4.2
pkgrel=2
pkgdesc="A pair of Linux kernel drivers for DDC/CI monitors (DKMS)"
arch=('i686' 'x86_64' 'aarch64')
url="https://gitlab.com/ddcci-driver-linux/ddcci-driver-linux/"
license=('GPL2')
depends=('dkms')
conflicts=("ddcci-driver-linux")
source=(
  "https://gitlab.com/ddcci-driver-linux/ddcci-driver-linux/-/archive/v${pkgver}/ddcci-driver-linux-v${pkgver}.tar.gz"
  "linux-6.1-fix.patch::https://gitlab.com/ddcci-driver-linux/ddcci-driver-linux/-/merge_requests/11.patch"
)
b2sums=('b21e02c964579f194026bc9f6cb687ea07ad91f55806d7af685813d4ee144b5495b1ad27a00e83be6a87248be195b680b14fad08cf9cfc1351f4070a69e92d6f'
        'fae85a07821b5e32754a4d30e547a530a099032250ce260a5098ecade2f4527a9c33cf47d365fe620f7674a4700a0bbe85aa2b83f0ed0c2b8c40fe9ec4d487fd')

prepare() {
    cd "ddcci-driver-linux-v${pkgver}"
    patch --forward --strip=1 --input="${srcdir}/linux-6.1-fix.patch"
}

package() {
  local destdir="${pkgdir}/usr/src/ddcci-${pkgver}"

  install -d "${destdir}"
  cp -rT "ddcci-driver-linux-v${pkgver}" "${destdir}"
}
