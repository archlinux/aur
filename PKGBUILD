# Maintainer: Catppuccin <releases@catppuccin.com>

# shellcheck disable=2034,2154
# shellcheck shell=bash

pkgname=papirus-folders-catppuccin-git
pkgver=r27.667f3e7a
pkgrel=1
pkgdesc="Soothing pastel theme for Papirus Icon Theme folders"
arch=("any")
url="https://github.com/catppuccin/papirus-folders"
license=("MIT")
depends=('papirus-icon-theme')
makedepends=('git')
options=('!strip')
provides=("papirus-folders")
conflicts=("papirus-folders")
source=("$pkgname::git+$url.git"
  "papirus-folders.hook"
  "_papirus-folders"
  "papirus-folders")
md5sums=('SKIP'
         '2acbe66d274f220ce1beb47fadcfbec0'
         '7b1e8e8bd907eb21f67b4b7a78d060a0'
         '6d050ecde3af37ce74a4a89cdc35990d')

pkgver() {
  cd "$srcdir/$pkgname" || exit 1
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname" || exit 1
  install -dm755 "$pkgdir/usr/share/icons/Papirus"
  cp -r src/* "$pkgdir/usr/share/icons/Papirus"

  install -Dm755 papirus-folders -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname}"
  install -Dm644 ../papirus-folders.hook -t "$pkgdir/usr/share/libalpm/hooks"

  install -Dm644 ../papirus-folders -t "$pkgdir/usr/share/bash-completion/completions"
  install -Dm644 ../_papirus-folders -t "$pkgdir/usr/share/zsh/site-functions"
}
