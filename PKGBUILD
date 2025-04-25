# Maintainer: witt <1989161762 at qq dot com>

pkgname=bongo-cat
pkgver=0.2.1
pkgrel=1
pkgdesc="BongoCat 是一个可爱地互动桌面宠物应用，让你的桌面充满乐趣！"
arch=('any')
url="https://github.com/ayangweb/BongoCat"
license=('MIT')
provides=("bongo-cat" "bongocat" "BongoCat")
conflicts=("bongo-cat")
depends=("webkit2gtk-4.1")
optdepends=()
source=(
  "${pkgname%-bin}-${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/BongoCat_${pkgver}_amd64.deb"
  "LICENSE::https://raw.githubusercontent.com/ayangweb/BongoCat/refs/heads/master/LICENSE"
)
sha256sums=('913e0f4838fd6173745ea6d4ae96328db4b9d51ad151306b422b1ce15bee3e07'
            '1a164304cda4e01afc74bed12c93ef7d366958bf596d66477e63d315e42a23ce')

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
