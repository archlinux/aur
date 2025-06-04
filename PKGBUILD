# Maintainer: witt <1989161762 at qq dot com>

pkgname=myhelper-bin
pkgver=0.0.1
pkgrel=1
pkgdesc="🔥跨平台桌面效率工具 - 支持可上传、下载的插件市场"
arch=('x86_64' 'aarch64')
url="https://github.com/MyHelperHub/MyHelper"
license=('GPL-3.0')
provides=('myhelper-bin' 'myhelper')
conflicts=('myhelper')
depends=("webkit2gtk-4.1")
optdepends=()
source=(
  "LICENSE::https://raw.githubusercontent.com/MyHelperHub/MyHelper/refs/heads/main/LICENSE"
)
source_x86_64=(
  "${pkgname%-bin}-${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/myhelper_${pkgver}_amd64.deb"
)
# source_aarch64=(
#   "${pkgname%-bin}-${pkgver}_arm64.deb::${url}/releases/download/v${pkgver}/myhelper_${pkgver}_arm64.deb"
# )
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('413213557351437fe9db4a93f1d0229f6cff3cdb320495b0bb657473ef129838')
# sha256sums_aarch64=('49007c1b6d47cac351712ca134011a104341f3f1b580d1493b4cf9e4bb180c35')

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
  # find "usr/lib/myhelper/assets" -type f -exec install -Dm644 {} "${pkgdir}/{}" \;

  # license
  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim: set sw=2 ts=2 et:
