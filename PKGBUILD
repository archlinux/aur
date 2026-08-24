# Maintainer: cublueer <starriver_alvin@163.com>
#
# octa-term-bin：下载 GitHub Release 上预编译的 pkg.tar.zst 并安装，
# 无需本机编译。资产由 packaging/arch/octa-term（源码包）构建后上传：
#   PACKAGER='cublueer <cublueer@users.noreply.github.com>' makepkg -Cf
#   gh release create v${pkgver} octa-term-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst

pkgname=octa-term-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='终端无感数学计算：把 shell 输入行变成 Octave 计算器（预编译包）'
arch=('x86_64')
url='https://github.com/cublueer/octa-term'
license=('MIT')
options=('!strip' '!debug')
export LC_ALL=C.UTF-8
depends=('octave' 'libgcc' 'glibc')
optdepends=(
  'fish: fish shell integration (Enter 劫持、多行矩阵、自动续行)'
  'bash: bash shell integration (单行兜底)'
  'zsh: zsh shell integration (单行兜底)'
)
provides=('octa-term')
conflicts=('octa-term')
source=(
  "octa-term-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst::https://github.com/cublueer/octa-term/releases/download/v${pkgver}/octa-term-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst"
)
sha256sums=(
  'e7b27a757107137c0520d4bc55cb0198dff82a2745cfc71c3745b4bfbefe4655'
)

package() {
  # 资产本身就是完整包布局（usr/bin/octa-term + LICENSE），直接解进 pkgdir
  bsdtar -xf "${srcdir}/octa-term-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" \
    -C "${pkgdir}" \
    --exclude '.BUILDINFO' --exclude '.MTREE' --exclude '.PKGINFO'
}
