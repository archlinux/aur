# Maintainer: lostmason <lostmason@tutamail.com>
# Contributor: blx32 <gmoura96@icloud.com>
pkgname=xeres-bin
pkgver=1.1.1
pkgrel=1
pkgdesc='A decentralized and secure application designed for communication and sharing.'
arch=('x86_64')
url="https://xeres.io"
license=('GPL-3.0-or-later')
depends=('xdg-utils')
source=("https://github.com/zapek/Xeres/releases/download/v${pkgver}/xeres_${pkgver}_ubuntu-24.04_amd64.deb")
sha512sums=('adb11c17bdcf1aaa9a1b80aef610ce3411961646f7b74259e77d9dd59de27723bea186d0077035c5f167018c4a8a5486291424a91fc01f5bada23f50574f8e3d')
provides=('xeres')
conflicts=('xeres')
options=('!strip')
install=post.install

prepare() {
  cd "${srcdir}"
  tar -xf data.tar.zst
}

package() {
  cd "${srcdir}"
  install -d "${pkgdir}/opt/xeres"
  cp -R opt/xeres/* "${pkgdir}/opt/xeres"

  install -d "${pkgdir}/usr/bin"
  ln -s /opt/xeres/bin/Xeres "${pkgdir}/usr/bin/xeres"

  install -Dm644 "${srcdir}/opt/xeres/lib/xeres-Xeres.desktop" "${pkgdir}/usr/share/applications/xeres.desktop"
  install -Dm644 "${srcdir}/opt/xeres/lib/Xeres.png" "${pkgdir}/usr/share/pixmaps/xeres.png"
}
