# Maintainer: SHORiN <shorin@users.noreply.github.com>
#
# AUR `miyu` 包装包：下载 GitHub Release 上的预编译资产重新打包（避免让
# AUR 用户本地编译）。0.4.4 起字体（Noto CJK / Noto Emoji / JetBrains Mono）
# 已随 release 资产一并打包，不再从上游单独拉取。

pkgname=miyu
pkgver=0.6.1
pkgrel=1
pkgdesc='一个活在终端里的二次元少女。开箱即用的开源 AI 助手，支持接入通讯平台。'
arch=('x86_64')
url='https://github.com/SHORiN-KiWATA/miyu-agent'
license=('MIT' 'OFL-1.1')
options=('!strip' '!debug')
export LC_ALL=C.UTF-8
depends=('alsa-lib' 'chafa' 'gcc-libs' 'glibc' 'onnxruntime' 'python' 'ripgrep')
optdepends=(
  'miyu-voice: voice wake word + speech recognition front end'
  'git: update default Shorin Wiki knowledge base'
  'libnotify: 桌面通知(kitty 以外的终端由它弹)'
  'libcanberra: 通知提示音(没有时退到 pw-play/paplay)'
  'fish: fish shell integration support'
  'bash: bash shell integration support'
  'zsh: zsh shell integration support'
  'python-playwright: 网页检索脚本(小红书/知乎/闲鱼/酒店比价)'
  'xorg-server-xvfb: 网页检索脚本后台运行所需的虚拟显示'
  'chromium: 网页检索脚本的浏览器(或改装 google-chrome)'
  'python-qrcode: 扫码登录时在终端里画二维码'
)
_release_pkgrel=1
source=(
  "${pkgname}-${pkgver}-${_release_pkgrel}-${CARCH}.release.pkg.tar.zst::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}-${_release_pkgrel}-${CARCH}.pkg.tar.zst"
)
sha256sums=(
  '277f396250b4c7715d5cabcdc8acc06a5aee5ac4f57cbb2d4449ced9326bc8b6'
)

# Keep the last published version and checksum until channel_update records
# the newly verified release asset. Never use SKIP for a binary release asset.
package() {
  install -d "${pkgdir}/usr"
  cp -a "${srcdir}/usr/." "${pkgdir}/usr/"
}
