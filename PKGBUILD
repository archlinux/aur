# Maintainer: qaz <fkxxyz@163.com>
# Maintainer: qaz <fkxxyz@163.com>

pkgname=tenvideo
pkgver=1.0.10
pkgrel=1
pkgdesc="Tencent Video is committed to building China's leading online video media platform"
arch=('x86_64')
url="https://v.qq.com"
license=('custom:tencent')
depends=('libappindicator-gtk3' 'nss' 'libxss' 'xdg-utils' 'libsecret' 'libnotify')
conflicts=('deepin-qq-im')
source=(
  "https://dldir1.qq.com/qqtv/linux/Tenvideo_universal_${pkgver}_amd64.deb"
  "https://www.qq.com/contract20180827.htm"
  )

prepare() {
  cd ${srcdir}
  bsdtar xf data.tar.xz
}

build() {
  cd ${srcdir}
  v=$'\u817e\u8baf\u89c6\u9891'
  rm -rf "opt/tenvideo"
  mv "opt/$v" "opt/tenvideo"
  sed -i 's/\/opt\/'"$v"'/\/opt\/tenvideo/g' "usr/share/applications/TencentVideo.desktop"
}

package() {
  cd ${srcdir}
  cp -rf "opt" "usr" "${pkgdir}/"
  install -Dm644 "contract20180827.htm" "${pkgdir}/usr/share/licenses/tenvideo/contract.htm"
  install -d "${pkgdir}/usr/bin"
  ln -sf "/opt/tenvideo/TencentVideo" "${pkgdir}/usr/bin/tenvideo"
}

# vim:set ts=2 sw=2 et:
sha256sums=('d890f867c92e3620950764896c4dd54ef0f552c79d55998458d4bf046ae2452a'
            '43a7774ae2b5382b77d889672b8a004e8e168f112ce09eb0262dad56a68de7c2')

