# Maintainer: Catppuccin <releases@catppuccin.com>

# shellcheck disable=2034,2154
# shellcheck shell=bash

pkgname=papirus-folders-catppuccin-git
pkgver=r30.f83671d1
pkgrel=2
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
  "papirus-folders::https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-folders/master/papirus-folders")
md5sums=('SKIP'
         '2acbe66d274f220ce1beb47fadcfbec0'
         'SKIP')

pkgver() {
  cd "$srcdir/$pkgname" || exit 1
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname" || exit 1
  install -dm755 "$pkgdir/usr/share/icons/Papirus"
  cp -r src/* "$pkgdir/usr/share/icons/Papirus"
  cp ../papirus-folders ../_papirus-folders

  install -Dm755 ../papirus-folders -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname}"
  install -Dm644 ../papirus-folders.hook -t "$pkgdir/usr/share/libalpm/hooks"

  install -Dm644 ../papirus-folders -t "$pkgdir/usr/share/bash-completion/completions"
  install -Dm644 ../_papirus-folders -t "$pkgdir/usr/share/zsh/site-functions"
}
