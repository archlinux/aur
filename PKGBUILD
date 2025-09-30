# Maintainer: Magus <packaging@example.com>
pkgname=magelab-bin
pkgver=0.7.2
pkgrel=1
pkgdesc="Mage Lab is a user-centric AI interface with local reasoning and tools"
arch=('x86_64')
url="https://github.com/majesticio/magelab"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator')
provides=('magelab')
conflicts=('magelab')
options=('!strip' '!emptydirs')
source=("LICENSE::https://raw.githubusercontent.com/majesticio/mage-lab/v${pkgver}/LICENSE")
source_x86_64=("magelab_${pkgver}_amd64.deb::https://cdn.crabnebula.app/asset/01K5SDPHFBC4AC3HSWN1PSPP01")
sha256sums=('SKIP')
sha256sums_x86_64=('eddd0f869cb5ba18f7c5e41b3d2581f01e01ebe0201921d2ab049b93b0211fd8')

prepare() {
  cd "${srcdir}"
  bsdtar -xf "magelab_${pkgver}_amd64.deb"
}

package() {
  cd "${srcdir}"
  local data_tar
  data_tar=$(find "${PWD}" -maxdepth 1 -name 'data.tar.*' -print -quit)
  bsdtar -xf "${data_tar}" -C "${pkgdir}"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
