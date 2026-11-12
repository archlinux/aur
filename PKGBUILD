# Maintainer: Omansh Krishn omansh@duck.com

pkgname=materialious-bin
pkgver=1.18.25
pkgrel=1
pkgdesc='Modern material design for Invidious'
arch=('x86_64' 'aarch64')
url='https://github.com/Materialious/Materialious'
license=('AGPL3')
makedepends=( libarchive )
depends=('at-spi2-core' 'gtk3' 'libnotify' 'libsecret' 'libxss' 'libxtst' 'nss' 'util-linux-libs' 'xdg-utils' )
optdepends=( libappindicator-gtk3 )
provides=('materialious')
conflicts=('materialious-git')
options=(!debug)


source_x86_64=("materialious-${pkgver}-x86_64.deb::${url}/releases/download/${pkgver}/Materialious-linux-amd64.deb")
source_aarch64=("materialious-${pkgver}-aarch64.deb::${url}/releases/download/${pkgver}/Materialious-linux-arm64.deb")
sha256sums_x86_64=('2cf3a8e7dcb883278e1e193319d386d5236e174efa38ec17d2d0eca796125b29')
sha256sums_aarch64=('226cd868097396bc6fdb3da5536139ac0982f7cc29d48f99e7b7ead7f9881736')

package() {

  cd "${srcdir}"
  bsdtar -xf "${srcdir}/data.tar.xz"
  install -dm755 "${pkgdir}/opt"
  cp --preserve=mode -r 'opt' "${pkgdir}/"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/Materialious/materialious" "${pkgdir}/usr/bin/materialious"

  install -dm755 "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
  install -m644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/materialious.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/materialious.png"

  install -dm755 "${pkgdir}/usr/share/applications"
  install -Dm644 "${srcdir}/usr/share/applications/materialious.desktop" "${pkgdir}/usr/share/applications/materialious.desktop"

}
