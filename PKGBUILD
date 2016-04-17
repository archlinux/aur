# Maintainer: aksr <aksr at t-com dot me>
pkgname=qgrep-git
pkgver=r347.ea1a2a8
pkgrel=1
epoch=
pkgdesc="Fast regular expression grep for source code with incremental index updates."
arch=('i686' 'x86_64')
url="https://github.com/zeux/qgrep"
license=('BSD')
groups=()
depends=('')
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=('qgrep')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/zeux/qgrep.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 qgrep $pkgdir/usr/bin/qgrep
  install -Dm644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
  sed '220,243!d' README.md > LICENSE
  install -Dm644 qgrep $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
  mkdir -p $pkgdir/usr/share/vim/vimfiles
  cp -r vim/* $pkgdir/usr/share/vim/vimfiles
}

