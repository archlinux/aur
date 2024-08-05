# Maintainer: easterNday <849919718@qq.com>
pkgname=read-cat-insiders
_pkgname=ReadCat
pkgver=1.0.0
_pkgsubver=dev.240707
pkgrel=1
epoch=
pkgdesc="一款免费、开源、简洁、纯净、无广告的小说阅读器"
arch=('x86_64')
url="https://read-cat.top/"
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=

source=("https://github.com/UnicomStudio/Repositories/raw/main/read-cat-insiders/ReadCat.desktop" "https://raw.githubusercontent.com/read-cat/read-cat/main/public/icons/512x512.png")
source_x86_64=('https://github.com/read-cat/read-cat/releases/download/v1.0.0-dev.240707/ReadCat-linux-x64-1.0.0-dev.f6f397a3.tar.gz')
noextract=()
sha256sums=('a9d3e4af9511ff2544594a20e1665aa7a6369729d727f8881e3555ba1ec10612'
            'df9b2d497a9ae1a0741689d9e5aa72e3a1ce94f57ceafc5e681b2dbcf82f43fe')
sha256sums_x86_64=('08259b53a11adc78f5b3cdbb55efb3282bcad3182d59c76e673832fa27c087fa')
validpgpkeys=()

shopt -s extglob

package() {
  install -d -m755 "${pkgdir}/opt/${pkgname}"
  install -d -m755 "${pkgdir}/usr/bin"
  install -d -m755 "${pkgdir}/usr/share/"{applications,pixmaps}
  cp -r "${srcdir}"/!(ReadCat.desktop|${_pkgname}-linux-@(x|arm)64-${pkgver}-*.tar.gz)/* "${pkgdir}/opt/${pkgname}"
  ln -s "/opt/${pkgname}/bin/read-cat-insiders" "${pkgdir}/usr/bin/read-cat-insiders"
  install -D -m644 "${srcdir}/ReadCat.desktop" "${pkgdir}/usr/share/applications/ReadCat.desktop"
  install -D -m644 "${srcdir}/512x512.png" "${pkgdir}/usr/share/pixmaps/ReadCat.png"

  # Fix chrome-sandbox permissions
  chown root "${pkgdir}/opt/${pkgname}/chrome-sandbox"
  chmod 4755 "${pkgdir}/opt/${pkgname}/chrome-sandbox"
}
