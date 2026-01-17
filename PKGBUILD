# Maintainer: witt <1989161762 at qq dot com>

pkgname=bongo-cat
pkgver=0.9.0
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
sha256sums_x86_64=('4aaf7ca925d43a92c5605dc6bbdbd8396e52d8aa62a60a53063b8b756a9ecc87')
sha256sums_aarch64=('990cf13116e4576dd844b93f2a82eceb1c938d425856b2c12f81c8509f684b9e')

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
