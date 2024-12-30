# Maintainer: William Di Luigi <williamdiluigi@gmail.com>

pkgname=latexrun-git
pkgver=r134.38ff6ec
pkgrel=2
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
  '0001-biber-nocite-star.patch'
  '0002-fix-regex-syntaxwarnings.patch'
)
sha256sums=('SKIP'
            'f906f761af941acc2a474a155787698a3d29d25f86234ec3d5bffdee8a82085a'
            '1e3a90b6d5ff86e8d98ecc717f0dc9dc8fb478b8ec2bc38da95d07732d8ff2fd')

pkgver() {
  cd latexrun
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd latexrun
  patch -p1 < "$srcdir"/0001-*.patch
  patch -p1 < "$srcdir"/0002-*.patch
}

package() {
  cd latexrun

  # Copy the main script
  install -D -m755 latexrun $pkgdir/usr/bin/latexrun
}
