# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Contributor: Tomas Storck <storcktomas@gmail.com>
# Contributor: Tom Richards <tom@tomrichards.net>

pkgname=neovim-symlinks
pkgver=3
pkgrel=1
pkgdesc='Runs neovim if vi or vim is called'
arch=('any')
depends=('neovim' 'sh')
provides=('vim' 'vi')
conflicts=('vim' 'vi' 'vi-vim-symlink')

package() {
  install -dm755 "$pkgdir/usr/bin/"

  echo -e '#!/bin/sh\nexec nvim -e "$@"'  > "$pkgdir/usr/bin/ex"
  echo -e '#!/bin/sh\nexec nvim -E "$@"'  > "$pkgdir/usr/bin/exim"
  echo -e '#!/bin/sh\nexec nvim -RZ "$@"' > "$pkgdir/usr/bin/rview"
  echo -e '#!/bin/sh\nexec nvim -Z "$@"'  > "$pkgdir/usr/bin/rvim"
  echo -e '#!/bin/sh\nexec nvim -R "$@"'  > "$pkgdir/usr/bin/view"
  echo -e '#!/bin/sh\nexec nvim -d "$@"'  > "$pkgdir/usr/bin/vimdiff"
  chmod 755 "$pkgdir/usr/bin/"*

  for _link in edit vedit vi vim; do
    ln -s nvim "$pkgdir/usr/bin/$_link"
  done
}
