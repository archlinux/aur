# Maintainer: Become-ILLUSORY <becomeillusory@gmail.com>

# 跟随上游 GitHub release 的 latest 二进制包（官方用 package-arch.sh 打的 .pkg.tar.zst，
# 词库已内置）。

pkgname=wowtype-core
pkgver=0.3.10
pkgrel=1
pkgdesc='WeChat-style pinyin input method for fcitx5, with bundled dictionaries and language model'
arch=('x86_64')
url='https://github.com/Gloridust/WowType'
license=('MIT' 'Apache-2.0' 'GPL-3.0-only' 'CC-BY-SA-4.0' 'Unicode-3.0')
depends=('fcitx5' 'alsa-lib' 'gcc-libs' 'glibc' 'python')
optdepends=('python-gobject: settings app' 'gtk4: settings app' 'libadwaita: settings app'
            'noto-fonts-emoji: color emoji in candidates' 'curl: translate mode')
conflicts=('wowtype')
provides=('wowtype')
install="$pkgname.install"

# gh-proxy.com 前缀用于国内加速；换镜像只需 export GH_MIRROR=https://另一镜像/
_gh_mirror="${GH_MIRROR:-https://gh-proxy.com/}"
_pkgfile="wowtype-$pkgver-1-x86_64.pkg.tar.zst"
source=(
  "$_pkgfile::${_gh_mirror}https://github.com/Gloridust/WowType/releases/download/v$pkgver/$_pkgfile"
)
# checksum 由 aur-auto-update 定期跟随 releases/latest 更新
sha256sums=('4e8c81c4d0b3c44e650aa29168bfc1791005b57d6c18b3a5ce985680b71a6dae')

package() {
  # 官方 .pkg.tar.zst 已被 makepkg 自动解压到 srcdir，只把 usr/ 树收进 pkgdir
  cp -a "$srcdir"/usr "$pkgdir"/
}