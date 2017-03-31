# Maintainer: Anthony Nowell <anowell@gmail.com>

_gitname=algorithmia-cli
pkgname=algorithmia-git
pkgver=2017.03.31.g4b11175
pkgrel=1
pkgdesc="Algorithmia command line interface tools (git version)"
arch=('i686' 'x86_64')
url="https://algorithmia.com/"
license=('MIT')
makedepends=('rust' 'cargo')
conflicts=('algorithmia-bin')
source=("git+https://github.com/algorithmiaio/${_gitname}")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git log -1 --format="%cd.g%h" --date=short | sed 's/-/./g'
}

build() {
  cd "${srcdir}/${_gitname}"
  cargo build --release
}

package() {
  cd "${srcdir}/${_gitname}/target/release"
  mkdir -p "$pkgdir/usr/bin/"
  install -m 755 algo "$pkgdir/usr/bin/"

  cd "${srcdir}/${_gitname}"
  mkdir -p "$pkgdir/usr/share/bash-completion/completions/"
  install -m 644 completions/bash/algo "$pkgdir/usr/share/bash-completion/completions/"
  mkdir -p "$pkgdir/usr/local/share/share/zsh/site-functions/"
  install -m 644 completions/zsh/_algo "$pkgdir/usr/local/share/share/zsh/site-functions/"
}
