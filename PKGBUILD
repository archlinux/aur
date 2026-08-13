# Maintainer: SHORiN <shorin@users.noreply.github.com>
#
# AUR `miyu` 包装包：下载 GitHub Release 上由 packaging/arch/miyu-release
# 构建的预编译资产，补上 Noto 字体后重新打包（避免让 AUR 用户本地编译）。

pkgname=miyu
pkgver=0.4.1
pkgrel=1
pkgdesc='一个活在终端里的二次元少女。开箱即用的开源 AI 助手，支持接入通讯平台。'
arch=('x86_64')
url='https://github.com/SHORiN-KiWATA/Miyu'
license=('MIT' 'OFL-1.1')
options=('!strip' '!debug')
export LC_ALL=C.UTF-8
depends=('chafa' 'gcc-libs' 'ripgrep' 'alsa-lib')
optdepends=(
  'git: update default Shorin Wiki knowledge base'
  'fish: fish shell integration support'
  'bash: bash shell integration support'
  'zsh: zsh shell integration support'
)
_release_pkgrel=1
_cjk_version='Sans2.004'
_emoji_version='v2.051'
source=(
  "${pkgname}-${pkgver}-${_release_pkgrel}-${CARCH}.release.pkg.tar.zst::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}-${_release_pkgrel}-${CARCH}.pkg.tar.zst"
  "NotoSansCJK-Regular.ttc::https://raw.githubusercontent.com/notofonts/noto-cjk/${_cjk_version}/Sans/OTC/NotoSansCJK-Regular.ttc"
  "NotoColorEmoji.ttf::https://raw.githubusercontent.com/googlefonts/noto-emoji/${_emoji_version}/fonts/NotoColorEmoji.ttf"
  "NotoSansCJK.LICENSE::https://raw.githubusercontent.com/notofonts/noto-cjk/${_cjk_version}/LICENSE"
  "NotoColorEmoji.LICENSE::https://raw.githubusercontent.com/googlefonts/noto-emoji/${_emoji_version}/LICENSE"
)
sha256sums=(
  '9363a3c0e39ef7795f5723b06b7a3c109880e368379495cc8a1495a963366155'
  'b76b0433203017ca80401b2ee0dd69350349871c4b19d504c34dbdd80541690a'
  '72a635cb3d2f3524c51620cdde406b217204e8a6a06c6a096ff8ed4b5fd6e27b'
  '6a73f9541c2de74158c0e7cf6b0a58ef774f5a780bf191f2d7ec9cc53efe2bf2'
  '500bb1ccf43df7bbb522112f9133a52b16e1c35e809632f5d8609b179152de5b'
)

package() {
  install -Dm755 "${srcdir}/usr/bin/miyu" "${pkgdir}/usr/bin/miyu"
  cp -a "${srcdir}/usr/share" "${pkgdir}/usr/"
  install -Dm644 "${srcdir}/NotoSansCJK-Regular.ttc" "${pkgdir}/usr/share/miyu/fonts/NotoSansCJK-Regular.ttc"
  install -Dm644 "${srcdir}/NotoColorEmoji.ttf" "${pkgdir}/usr/share/miyu/fonts/NotoColorEmoji.ttf"
  install -Dm644 "${srcdir}/NotoSansCJK.LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/NotoSansCJK.LICENSE"
  install -Dm644 "${srcdir}/NotoColorEmoji.LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/NotoColorEmoji.LICENSE"
}
