# Maintainer: Excalibur <saberconer@gmail.com>

_pkgname=ch9344
pkgname=${_pkgname}-dkms
pkgver=1.9
pkgrel=2
url="https://www.wch.cn/downloads/CH9344SER_LINUX_ZIP.html"
pkgdesc="Kernel module for CH9344/CH348 USB UART controller"
license=('unknown')
arch=('any')
depends=('dkms')
makedepends=('unzip')
conflicts=("${_pkgname}")
optdepends=('linux-headers: Build the module for Arch kernel'
            'linux-lts-headers: Build the module for LTS Arch kernel')
source=("CH9344SER_LINUX-$pkgver.ZIP::https://www.wch.cn/downloads/file/386.html"
        'dkms.conf'
        'fix-incompatible-pointer-types.patch')
noextract=("CH9344SER_LINUX-$pkgver.ZIP")
sha256sums=('2eb9bfb6a4e61834dc89565ef7f7b05abba77299ee05c98103a0eb85f2fb50e2'
            'cac2091fcfc7276c1b6fa5f5e0fa811f5aa51b9529652b02766ec933904e308f'
            'd12452dcb757788bb4e8ee954419915e960bd8654323ab3f504360bcecdb5356')

prepare() {
  cd "$srcdir"
  unzip -o "CH9344SER_LINUX-$pkgver.ZIP"
  patch LINUX/driver/ch9344.c fix-incompatible-pointer-types.patch
}

build() {
    :
}

package() {
  dir_name="${_pkgname}-${pkgver}"
  install -d "${pkgdir}"/usr/src/${dir_name}/
  install -Dm644 dkms.conf "$srcdir"/LINUX/driver/* "${pkgdir}/usr/src/${dir_name}/"

  sed -e "s/@_PKGNAME@/${_pkgname}/g" \
      -e "s/@PKGVER@/${pkgver}/g" \
      -i "${pkgdir}/usr/src/${dir_name}/dkms.conf"
}
