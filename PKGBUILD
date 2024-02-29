# Maintainer: PhantomX <real.phantomx+aur@proton.me>

_pkgname=guilded
_electron=electron
pkgname=${_pkgname}_arch_electron
pkgver=1.0.9236953
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
sha512sums=('383b68e884215fc3bbece7cae26856b472b1a63c8dc4f778ccc5e0338210da33c8d077e5b4ea81d0c6cfb302fb65d19c221b06340571e1d27013ed347aa5ca15'
	  '255f28575321801ba7ac35c72fc87bfb81551dd0c1c8f892fe7baca3d8ebf67adc3ebe57f48d4729f4b34f1879211a71beb68e66663ed8af9f6e5f6c173a897f')
prepare() {
  tar Jxvf data.tar.xz
  sed -i "s|@PKGNAME@|${_pkgname}|;s|@ELECTRON@|${_electron}|" guilded-launcher.sh
  sed -i "s|Exec=.*|Exec=/usr/bin/$_pkgname %U|" usr/share/applications/guilded.desktop
}

package() {
  cp -r usr "$pkgdir"/usr

  # Install the app
  install -d "$pkgdir"/usr/share/$_pkgname

  # Copy Relevant data
  cp -r opt/Guilded/resources "$pkgdir"/usr/share/$_pkgname/

  install -d "$pkgdir"/usr/{bin,share/{icons,applications,doc}}
  install -Dm 755 "${srcdir}/guilded-launcher.sh" "${pkgdir}/usr/bin/${_pkgname}"

}
