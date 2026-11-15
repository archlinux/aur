# Maintainer: Felipe BF <fprgw32 at gmail dot com>
# Contributor: Shayne Hartford <shayneehartford@gmail.com>

_name=lotion
pkgbase="${_name}-fonts-git"
pkgname=("ttf-${_name}-git" "woff2-${_name}-git")
pkgver=r16.eca92f3
pkgrel=1
pkgdesc="A free monospace font for programming!"
arch=('any')
url="https://font.nina.coffee/"
license=('OFL-1.1')
makedepends=('git')

_repo="${_name}-dist"
source=("git+https://gitlab.com/nefertiti/${_repo}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_repo"
  
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_ttf-lotion-git() {
  provides=("ttf-${_name}")
  conflicts=("ttf-${_name}")

  cd "$srcdir/$_repo"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -d "$pkgdir/usr/share/fonts/TTF/${_name}"

  cd ttf
  for f in *.ttf; do
    install -Dm644 "$f" "$pkgdir/usr/share/fonts/TTF/${_name}"
  done
}

package_woff2-lotion-git() {
  provides=("woff2-${_name}")
  conflicts=("woff2-${_name}")

  cd "$srcdir/$_repo"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -d "$pkgdir/usr/share/fonts/WOFF2/${_name}"

  cd woff2
  for f in *.woff2; do
    install -Dm644 "$f" "$pkgdir/usr/share/fonts/WOFF2/${_name}"
  done
}

