# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Co-Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=veyon-bin
pkgver=4.8.3
pkgrel=1
pkgdesc="Cross-platform computer monitoring and classroom management"
arch=('x86_64')
url="https://veyon.io/"
license=('GPL-2.0-or-later')
depends=(
  'hicolor-icon-theme'
  'libfakekey'
  'libjpeg6-turbo'
  'libldap'
  'libprocps'
  'libsasl'
  'libvncserver'
  'libxcomposite'
  'libxcursor'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxinerama'
  'libxrandr'
  'libxtst'
  'pam'
  'polkit'
  'procps-ng'
  'qca-qt6'
  'qt6-5compat'
)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("https://github.com/veyon/veyon/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.0-fedora.38.x86_64.rpm")
noextract=("${pkgname%-bin}-${pkgver}.0-fedora.38.x86_64.rpm")
sha256sums=('584718b0e496cf3243e20cec6e60a420b0335c3da35f97adb845fb29fa9ad9e0')

prepare() {
  mkdir -p "${pkgname%-bin}-${pkgver}"
  bsdtar -xvf "${pkgname%-bin}-${pkgver}.0-fedora.38.x86_64.rpm" -C "${pkgname%-bin}-${pkgver}"
}

package() {
  cd "${pkgname%-bin}-${pkgver}"
  install -Dm755 usr/bin/* -t "${pkgdir}/usr/bin/"
  install -d "${pkgdir}/usr/lib"
  cp -r lib/systemd "usr/lib64/${pkgname%-bin}" "${pkgdir}/usr/lib/"
  cp -r usr/share "${pkgdir}/usr/"
}
