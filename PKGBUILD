# Maintainer: PhantomX <real.phantomx+aur@proton.me>

_pkgname=guilded
_electron=electron
pkgname=${_pkgname}_arch_electron
pkgver=1.0.9219633
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
sha512sums=('abdd060de685cf370ba636f7f7a7418977c101549fa1b7deb0d04aebc57c7e7049ea4251eabed672a70b85fbfcd371f9bb6977fa82efeee90327cc93e72372c3'
	  'a037f8589fa25ccc6a1de4bd98e633ca909106058988c6eeb40e83f23f0c6d2ab24c3c4e00b5c0ab7ebc20706f6d80bddfa2efbe01b22a4d7e60712d73c14557')
prepare() {
  tar Jxvf data.tar.xz
  sed -i "s|@PKGNAME@|${_pkgname}|;s|@ELECTRON@|${_electron}|" guilded-launcher.sh
  sed -i "s|Exec=.*|Exec=/usr/bin/$_pkgname %U|" usr/share/applications/guilded.desktop
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
