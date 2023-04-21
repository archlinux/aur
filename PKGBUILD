# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Co-Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=veyon-bin
pkgver=4.8.0
pkgrel=1
pkgdesc="Cross-platform computer monitoring and classroom management"
arch=('x86_64')
url="https://veyon.io/"
license=('GPL2')
depends=('hicolor-icon-theme' 'libfakekey' 'libldap' 'libsasl' 'libvncserver'
         'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxinerama'
         'libxrandr' 'libxtst' 'pam' 'procps-ng' 'qca-qt5')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("https://github.com/veyon/veyon/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.0-fedora.37.x86_64.rpm")
noextract=("${pkgname%-bin}-${pkgver}.0-fedora.37.x86_64.rpm")
sha256sums=('03b9880b958aa10462e4064ab4d415cebb6b84f5421c34fc04eb78e4a24abbe1')

prepare() {
  mkdir -p "${pkgname%-bin}-${pkgver}"
  bsdtar -xvf "${pkgname%-bin}-${pkgver}.0-fedora.37.x86_64.rpm" -C "${pkgname%-bin}-${pkgver}"
}

package() {
  cd "${pkgname%-bin}-${pkgver}"
  install -Dm755 usr/bin/* -t "${pkgdir}/usr/bin/"
  install -d "${pkgdir}/usr/lib"
  cp -r lib/systemd "usr/lib64/${pkgname%-bin}" "${pkgdir}/usr/lib/"
  cp -r usr/share "${pkgdir}/usr/"
}
