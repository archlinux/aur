# Maintainer: Breno Cunha Queiroz <breno1423@gmail.com>

pkgname=git-kudos-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Print repo contributions and give authors their well-deserved kudos!"
arch=(x86_64)
url="https://github.com/brenocq/git-kudos"
license=('MIT')
depends=(cmake git)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/git-kudos"
  git describe --tags | sed 's/^v//;s/-/+/g'
}

build() {
  cd "$srcdir/git-kudos"
  cmake -S . -B build
  cmake --build build
}

package() {
  cd git-kudos
  install -Dm755 build/git-kudos "$pkgdir/usr/bin/git-kudos"
  install -Dm644 completion/git-kudos.sh "$pkgdir/usr/share/bash-completion/completions/git-kudos"
  install -Dm644 completion/git-kudos.fish "$pkgdir/usr/share/fish/completions/git-kudos.fish"
  install -Dm644 completion/git-kudos.zsh "$pkgdir/usr/share/zsh/site-functions/_git-kudos"
}
