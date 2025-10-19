# Maintainer: GreyXor <greyxor@protonmail.com>

export GIT_LFS_SKIP_SMUDGE=1

pkgname=emopick-git
pkgver=r3.877858a
pkgrel=1
pkgdesc="A tiny, emoji picker for the terminal (git development version)"
arch=('any')
url="https://gitlab.com/greyxor/emopick"
license=('MIT')
depends=('awk' 'fzf' 'unicode-emoji')
makedepends=('git' 'git-lfs')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
    export GIT_LFS_SKIP_SMUDGE=1
  git lfs install --local
}


pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm755 emopick.sh "$pkgdir/usr/bin/emopick"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
