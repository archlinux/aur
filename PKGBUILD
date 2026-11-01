pkgname=kocr-bin
pkgver=0.4.0
pkgrel=1
pkgdesc='Offline OCR command-line tool (prebuilt binary)'
arch=('x86_64')
url='https://github.com/KercyDing/kocr'
license=('Apache-2.0')
depends=('glibc' 'gcc-libs')
provides=('kocr')
conflicts=('kocr')
source=("kocr-cli-0.4.0-linux-amd64.deb::https://github.com/KercyDing/kocr/releases/download/v0.4.0/kocr-cli-0.4.0-linux-amd64.deb")
sha256sums=('b960a547f8b328d3217d73f997f1b82c85b176fd2fbd5d5cfb46bda749346038')

package() {
  cd "${srcdir}"
  bsdtar -xf "kocr-cli-0.4.0-linux-amd64.deb"
  local data_tar
  data_tar=$(find . -maxdepth 1 -type f -name 'data.tar.*' | head -n 1)
  bsdtar -xf "${data_tar}"

  install -Dm644 "usr/share/doc/kocr/LICENSE" "${pkgdir}/usr/share/licenses/kocr-bin/LICENSE"
  install -Dm644 "usr/share/doc/kocr/NOTICE" "${pkgdir}/usr/share/licenses/kocr-bin/NOTICE"
  install -Dm644 "usr/share/doc/kocr/LICENSE-PaddleOCR" "${pkgdir}/usr/share/licenses/kocr-bin/LICENSE-PaddleOCR"
  install -Dm644 "usr/share/doc/kocr/LICENSE-SourceHanSans" "${pkgdir}/usr/share/licenses/kocr-bin/LICENSE-SourceHanSans"
  install -Dm755 usr/bin/kocr "${pkgdir}/usr/bin/kocr"
}
