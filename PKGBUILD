# See contacts at https://aur.archlinux.org/cgit/aur.git/tree/README.md?h=musike-bin

pkgname=musike-bin
_pkgname=musike
__pkgname=Musike
pkgver=1.5.1
pkgrel=2
pkgdesc="Open-source music player for YouTube Music"
arch=("x86_64" "aarch64")
url="https://github.com/Ernani1234/musike"
license=("MIT")
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux' 'libsecret')
optdepends=('libappindicator-gtk3: system tray support')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${_pkgname}-x86_64.deb::https://github.com/Ernani1234/${_pkgname}/releases/download/v${pkgver}/${__pkgname}-Setup-${pkgver}-Linux-x64.deb")
source_aarch64=("${_pkgname}-aarch64.deb::https://github.com/Ernani1234/${_pkgname}/releases/download/v${pkgver}/${__pkgname}-Setup-${pkgver}-Linux-arm64.deb")
sha256sums_x86_64=('163d5d89d265b48d51b381de812684f858eb74dcc81d23e8200f9f3c3d30e186')
sha256sums_aarch64=('58e524291836270e79c119bb386e7fe32c3fb7e6dffcb93a1b9594aa96394ad4')

prepare() {
  ar -x "${_pkgname}-${CARCH}.deb" data.tar.xz
  tar -xf data.tar.xz
}

package() {
  mkdir -vp "${pkgdir}/usr/share/applications"
  cp -vr --no-preserve=ownership --preserve=mode "usr/share/applications" "${pkgdir}/usr/share/"

  mkdir -vp "${pkgdir}/usr/share/icons"
  cp -vr --no-preserve=ownership --preserve=mode "usr/share/icons" "${pkgdir}/usr/share/"

  mkdir -vp "${pkgdir}/opt/${__pkgname}"
  cp -vr --no-preserve=ownership --preserve=mode "opt/${__pkgname}" "${pkgdir}/opt/"

  mkdir -vp "${pkgdir}/usr/bin"
  ln -sv "/opt/${__pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
