# Maintainer: witt <1989161762 at qq dot com>

pkgname=bongo-cat
pkgver=0.5.0
pkgrel=1
pkgdesc="BongoCat 是一个可爱地互动桌面宠物应用，让你的桌面充满乐趣！"
arch=('x86_64' 'aarch64')
url="https://github.com/ayangweb/BongoCat"
license=('MIT')
provides=("bongo-cat" "bongocat" "BongoCat")
conflicts=("bongo-cat")
depends=("webkit2gtk-4.1")
optdepends=()
source=(
  "LICENSE::https://raw.githubusercontent.com/ayangweb/BongoCat/refs/heads/master/LICENSE"
)
source_x86_64=(
  "${pkgname%-bin}-${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/BongoCat_${pkgver}_amd64.deb"
)
source_aarch64=(
  "${pkgname%-bin}-${pkgver}_arm64.deb::${url}/releases/download/v${pkgver}/BongoCat_${pkgver}_arm64.deb"
)
sha256sums=('1a164304cda4e01afc74bed12c93ef7d366958bf596d66477e63d315e42a23ce')
sha256sums_x86_64=('61079987e508e6d81d605ac6f8aab04c9658e97f955e04dcc3166660d1176fac')
sha256sums_aarch64=('49007c1b6d47cac351712ca134011a104341f3f1b580d1493b4cf9e4bb180c35')

build() {
  mkdir -p "build/";
  bsdtar -xf data.tar.gz -C "build/"
}

package() {
  # binary
  install -Dm755 "${srcdir}/build/usr/bin/"* -t "${pkgdir}/usr/bin/"

  # desktop
  install -Dm644 "${srcdir}/build/usr/share/applications/"*.desktop -t "${pkgdir}/usr/share/applications"

  cd "${srcdir}/build/";
  # icon
  find "usr/share/icons" -type f -exec install -Dm644 {} "${pkgdir}/{}" \;
  # lib
  find "usr/lib/BongoCat/assets" -type f -exec install -Dm644 {} "${pkgdir}/{}" \;

  # license
  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim: set sw=2 ts=2 et:
