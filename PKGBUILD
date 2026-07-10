# Maintainer: lostmason <lostmason@tutamail.com>
# Contributor: blx32 <gmoura96@icloud.com>
pkgname=xeres-bin
pkgver=1.2.2
pkgrel=1
pkgdesc='A decentralized and secure application designed for communication and sharing.'
arch=('x86_64')
url="https://xeres.io"
license=('GPL-3.0-or-later')
depends=('xdg-utils')
source=("https://github.com/zapek/Xeres/releases/download/v${pkgver}/xeres_${pkgver}_ubuntu-24.04_amd64.deb")
sha512sums=('124108b7d116f16a45fb185225480e6abd5337fb3d062c7c0787c002074126051680f67c8ed3e06a0be2fc1389953dbf1f7d16e537a89d7f8679c52300ce1abf')
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
