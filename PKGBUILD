# Maintainer: William Di Luigi <williamdiluigi@gmail.com>

pkgname=latexrun-git
pkgver=r134.38ff6ec
pkgrel=1
pkgdesc="A 21st century LaTeX wrapper"
arch=('any')
url="https://github.com/aclements/latexrun"
license=('MIT')
depends=(
  'python'
)
makedepends=(
  'git'
)

source=(
  'git+https://github.com/aclements/latexrun.git'
  'biber-nocite-star.patch'
)
sha256sums=('SKIP'
            'f906f761af941acc2a474a155787698a3d29d25f86234ec3d5bffdee8a82085a')

pkgver() {
  cd latexrun
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd latexrun
  patch -p1 < "$srcdir/biber-nocite-star.patch"
}

package() {
  cd latexrun

  # Copy the main script
  install -D -m755 latexrun $pkgdir/usr/bin/latexrun
}
