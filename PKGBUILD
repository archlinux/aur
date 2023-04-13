# Maintainer: Erik Bender <erik.bender@develerik.dev>
# Contributor: Sebastian Reuße <seb@wirrsal.net>

pkgname=fzf-marks-git
_gitname=fzf-marks
pkgver=r149.2ff907f
pkgrel=1
pkgdesc="Create, navigate and delete bookmarks in Bash and Zsh, using the fuzzy finder fzf"
arch=(any)
url=https://github.com/urbainvaes/fzf-marks
license=(MIT)
depends=(fzf)
makedepends=(git)
optdepends=(
  "zsh: to use with zsh"
  "bash: to use with bash"
)
provides=(fzf-marks)
conflicts=(fzf-marks)
source=(git+https://github.com/urbainvaes/fzf-marks)
md5sums=(SKIP)
install=fzf-marks.install

pkgver() {
  cd "$_gitname"
  # No tagged commits. ヽ(´ー｀)ノ
  commit=$(git rev-list --count master)
  hash=$(git rev-parse --short HEAD)
  echo "r$commit.$hash"
}

package() {
  cd "$_gitname"
  install -Dm644 README.md "$pkgdir"/usr/share/doc/fzf-marks/README.md
  install -Dm644 fzf-marks.plugin.bash "$pkgdir"/usr/share/fzf-marks/fzf-marks.bash
  install -Dm644 fzf-marks.plugin.zsh "$pkgdir"/usr/share/fzf-marks/fzf-marks.zsh
}
