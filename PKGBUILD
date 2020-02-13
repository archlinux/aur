# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=vim-gist-git
pkgver=7.3+7.g2158eceb
pkgrel=1
pkgdesc="Vim plugin for Gist"
arch=(any)
depends=(vim vim-webapi git)
groups=(vim-plugins)
url="https://github.com/mattn/vim-gist"
license=(custom:vim)
source=("git+$url")
sha256sums=('SKIP')
provides=(vim-gist=${pkgver%+*})
conflicts=(vim-gist)

pkgver() {
  git -C vim-gist describe --tags --long --abbrev=8 | sed 's/^v//; s/-/+/; s/-/\./'
}

package() {
  cd vim-gist
  for file in plugin/* autoload/* doc/*
  do
    install -D "$file" "$pkgdir"/usr/share/vim/vimfiles/"$file"
  done
}
