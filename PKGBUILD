# Maintainer: Martin Peres <martin.peres[at]free[dot]fr>
# Contributor: Timothée Ravier <tim[at]siosm[dot]fr>

pkgname=nouveau-fw
pkgver=325.15
pkgrel=1
pkgdesc="This package provides video & pgraph firmwares for all NVIDIA chipsets that need them"
url='http://nouveau.freedesktop.org/wiki/'
arch=('any')
license=('custom')
makedepends=('python2')
source=("https://raw.github.com/imirkin/re-vp2/master/extract_firmware.py"
        "http://us.download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run")
md5sums=('SKIP'
         '528fc538584de6446384b9cec3099d6c')
sha256sums=('SKIP'
            '3d790e4bfed24641f7cc76879144ab5d52b12271012ba381b0d33aa1a2e08775')

build() {
  sh NVIDIA-Linux-x86-${pkgver}.run --extract-only
  python2 extract_firmware.py
}

package() {
  install -dm 0755 "${pkgdir}"/usr/lib/firmware/nouveau/
  cp -a nv* vuc-* "${pkgdir}"/usr/lib/firmware/nouveau/
}

# vim:set ts=2 sw=2 et:
