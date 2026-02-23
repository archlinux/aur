# Maintainer: Your Name <your-email@example.com>
pkgname=fcitx5-theme-dracula-git
_pkgname=fcitx5-dracula-theme
pkgver=r5.a267e6f
pkgrel=2
pkgdesc="Dracula theme for Fcitx5"
arch=('any')
url="https://github.com/drbbr/fcitx5-dracula-theme"
license=('MIT')
depends=('fcitx5')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"

  # 定义安装目标路径（主题文件夹名为 Dracula）
  local _dest="${pkgdir}/usr/share/fcitx5/themes/Dracula"
  install -d "$_dest"

  # 将仓库中的所有文件（排除 git 记录和说明文件）复制到主题目录
  # 这里的 * 会匹配当前目录下的 theme.conf 和图片等
  cp -rt "$_dest" ./*

  # 清理掉不属于主题的杂物（可选，但不影响使用）
  rm -f "$_dest/README.md" "$_dest/LICENSE"
}
