# Maintainer: PhantomX <real.phantomx+aur@proton.me>

_pkgname=guilded
_electron=electron
pkgname=${_pkgname}_arch_electron
pkgver=1.0.9196665
pkgrel=1
pkgdesc="Chat for Gaming Communities using the system provided electron for increased security and performance"
arch=('x86_64')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
url="https://www.guilded.gg/"
license=('custom')
depends=("${_electron}" 'gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core'
  'util-linux-libs' 'libappindicator-gtk3' 'libsecret' 'libxkbcommon-x11'
  'alsa-lib' 'libxkbfile')
source=("${pkgname}-${pkgver}.deb::https://www.guilded.gg/downloads/Guilded-Linux.deb"
  'guilded-launcher.sh')
sha512sums=('f9cc5478bbc5a58c56cf8a8b60a78399b87133d6492e34cc3a747e13135f47addf76bfd520f067e92a5e0e28d490307bc1e22a4cad1a4cc3bf37be858f3cad94'
  'a037f8589fa25ccc6a1de4bd98e633ca909106058988c6eeb40e83f23f0c6d2ab24c3c4e00b5c0ab7ebc20706f6d80bddfa2efbe01b22a4d7e60712d73c14557')

prepare() {
  tar Jxvf data.tar.xz
  sed -i "s|@PKGNAME@|${_pkgname}|;s|@ELECTRON@|${_electron}|" guilded-launcher.sh
  sed -i "s|Exec=.*|Exec=/usr/bin/$_pkgname|" usr/share/applications/guilded.desktop
}

package() {
  cp -r usr "$pkgdir"/usr

  # Install the app
  install -d "$pkgdir"/usr/lib/$_pkgname

  # Copy Relevant data
  cp -r opt/Guilded/resources/* "$pkgdir"/usr/lib/$_pkgname/

  install -d "$pkgdir"/usr/{bin,share/{icons,applications,doc}}
  install -Dm 755 "${srcdir}/guilded-launcher.sh" "${pkgdir}/usr/bin/${_pkgname}"

}
