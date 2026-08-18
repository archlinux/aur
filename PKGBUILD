# Maintainer: Vitaliy VVS Star <vitaliy <dot> star <at> Gmail-DOT-Com>

pkgname=kudu-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="A modern, open-source system cleaner for Windows, macOS, and Linux"
arch=('x86_64')
url="https://github.com/AdventDevInc/kudu"
license=('MIT')
depends=(
  'gtk3'
  'nss'
  'libxss'
  'alsa-lib'
  'mesa'
  'fuse2'
)
provides=('kudu')
conflicts=('kudu')
options=('!strip')
noextract=("${pkgname}-${pkgver}.deb")
source_x86_64=("${pkgname}-${pkgver}.deb::https://github.com/AdventDevInc/kudu/releases/download/v${pkgver}/Kudu-${pkgver}-amd64.deb")
sha256sums_x86_64=('a03b0eafdd61f24df5f260966b3156b3682f7f2413407b4ac46f8a2c2af60668')

package() {
  bsdtar -xf "${pkgname}-${pkgver}.deb" data.tar.xz
  bsdtar -xJf data.tar.xz -C "${pkgdir}"

  # SUID sandbox (upstream postinst does the same)
  chmod 4755 "${pkgdir}/opt/Kudu/chrome-sandbox"

  install -d "${pkgdir}/usr/bin"
  ln -s /opt/Kudu/kudu "${pkgdir}/usr/bin/kudu"

  install -Dm644 "${pkgdir}/opt/Kudu/LICENSE.electron.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
