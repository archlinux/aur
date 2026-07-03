pkgname=cristalix-wl-fix
pkgver=1.0.1
pkgrel=4
pkgdesc="Wrapper script to run Cristalix on Wayland/NVIDIA"
arch=('any')
url="https://github.com/maseckt/cristalix-wl-fix"
license=('MIT')
depends=('java-runtime>=21' 'curl')
provides=("cristalix")
conflicts=("cristalix")

source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.sig::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz.sig")

sha256sums=('c913c53cf35a9e100a433436888211712b686c70c2a63b11c213306982b9a069'
            'SKIP')

validpgpkeys=('C6F9309AEEA733B868FF9049463FBD17A7D691B8')

package() {
  cd "${srcdir}"

  install -Dm755 AppRun "${pkgdir}/usr/bin/cristalix"
  install -Dm644 cristalix.desktop "${pkgdir}/usr/share/applications/cristalix.desktop"
  install -Dm644 cristalix.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/cristalix.png"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  sed -i "s|Exec=.*|Exec=/usr/bin/cristalix|" "${pkgdir}/usr/share/applications/cristalix.desktop"
  sed -i "s|Icon=.*|Icon=cristalix|" "${pkgdir}/usr/share/applications/cristalix.desktop"
}
