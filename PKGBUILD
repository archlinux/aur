pkgname=xlog-decoder-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="A tool to decode xlog files"
arch=('x86_64')
url="https://github.com/crowforkotlin/xlog-decoder"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'libsoup3' 'cairo' 'pango')
provides=('xlog-decoder')
conflicts=('xlog-decoder')
options=('!strip' '!debug')

source=("https://github.com/crowforkotlin/xlog-decoder/releases/download/1.0/xlog-decoder_${pkgver}_amd64.deb")
sha256sums=('SKIP')

package() {
  cd "${srcdir}"
  if [ -f data.tar.gz ]; then
    tar -xf data.tar.gz -C "${pkgdir}"
  elif [ -f data.tar.xz ]; then
    tar -xf data.tar.xz -C "${pkgdir}"
  elif [ -f data.tar.zst ]; then
    tar -xf data.tar.zst -C "${pkgdir}"
  fi

  # 将 Ubuntu 的 775 目录权限修正为 Arch 标准的 755
  find "${pkgdir}" -type d -exec chmod 755 {} +
}
