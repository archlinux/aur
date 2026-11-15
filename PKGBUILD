# Maintainer: neko_ayaya
# Maintainer: liblaf <30631553+liblaf@users.noreply.github.com>

pkgname=mihomo-smart-bin
pkgver=1.19.35.alpha.smart.r4862.gc4df732
pkgrel=1
_commit=c4df732
pkgdesc='Mihomo proxy kernel with the Smart policy group and the large LightGBM model (x86-64-v3)'
arch=('x86_64')
url='https://github.com/vernesong/mihomo'
license=('GPL-3.0-or-later')
provides=('mihomo' 'clash-meta')
conflicts=('mihomo' 'clash-meta')
backup=('etc/mihomo/config.yaml')
options=('!strip' '!debug')
install="${pkgname}.install"
source=(
  "mihomo-${_commit}.pkg.tar.zst::https://github.com/vernesong/mihomo/releases/download/Prerelease-Alpha/mihomo-linux-amd64-v3-alpha-smart-${_commit}.pkg.tar.zst"
  "Model-large-${pkgver}-${pkgrel}.bin::https://github.com/vernesong/mihomo/releases/download/LightGBM-Model/Model-large.bin"
)
noextract=("mihomo-${_commit}.pkg.tar.zst")
sha256sums=('8bc19065146571608cdcd60d56b3240d2e6d909e5373afd6fb0fca140b53a02f'
            '832920df1290454710dd04aa4c7d4b5324edfd7816a7c9ad2272708b5d5a13a8')

package() {
  bsdtar -xf "mihomo-${_commit}.pkg.tar.zst" -C "${pkgdir}" usr etc
  # mihomo loads the Smart model from its configuration directory.
  install -Dm644 "Model-large-${pkgver}-${pkgrel}.bin" "${pkgdir}/etc/mihomo/Model.bin"
}
