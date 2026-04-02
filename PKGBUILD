# Maintainer: x1nx3r <x1nx3r@github.com>
pkgname=lazypub-bin
_pkgname=lazypub
pkgver=0.1.8
pkgrel=1
pkgdesc="AI-powered lightweight EPUB translation and layout normalization workbench (Binary release)"
arch=('x86_64')
url="https://github.com/x1nx3r/Lazypub"
license=('MIT')
depends=('gtk3' 'webkit2gtk' 'libsoup3' 'libappindicator-gtk3' 'librsvg')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')
source=(
  "https://github.com/x1nx3r/Lazypub/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
  "https://raw.githubusercontent.com/x1nx3r/Lazypub/main/LICENSE"
)
sha256sums=('bac542990dcbb5adc3b5dddb2184a272c214138a2113744ac39713ba7ef0e44c'
            'a8927160a24c2ffeeb13bbd3333a930a836d130729ea12e8cf79163b153eb753')

package() {
  # Extract the data archive from the .deb
  ar x "${_pkgname}_${pkgver}_amd64.deb" data.tar.gz
  tar -xvf data.tar.gz -C "${pkgdir}"
  
  # Ensure the binary has executable permissions
  chmod +x "${pkgdir}/usr/bin/${_pkgname}"

  # Install the MIT license as required by Arch guidelines
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
