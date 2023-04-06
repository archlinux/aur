# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer: yochananmarqos <mark dot wagie at proton dot me>
pkgname=veyon-bin
pkgver=4.7.5
pkgrel=1
pkgdesc="Cross-platform computer monitoring and classroom management"
arch=('x86_64')
url="https://veyon.io/"
license=('GPL2')
depends=('hicolor-icon-theme' 'libfakekey' 'libldap' 'libsasl' 'libvncserver' 'libxi' 'qt5-base' 'libx11' 'glibc' 'openssl' 'libxcursor' \
    'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxinerama' 'libxrandr' 'libxtst' 'pam' 'procps-ng' 'qca-qt5' 'gcc-libs')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("https://github.com/veyon/veyon/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.0-fedora.37.x86_64.rpm")
noextract=("${pkgname%-bin}-${pkgver}.0-fedora.37.x86_64.rpm")
sha256sums=('c5b429913bb2b2fe327cd8b2ca75c2a198a48afe78e148da0209408dd81f3a97')

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