# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Contributor: Tomas Storck <storcktomas@gmail.com>
# Contributor: Tom Richards <tom@tomrichards.net>

pkgname=neovim-symlinks
pkgver=2
pkgrel=1
pkgdesc='Runs neovim if vi or vim is called'
arch=('any')
depends=('neovim' 'sh')
provides=('vim' 'vi')
conflicts=('vim' 'vi' 'vi-vim-symlink')

package() {
  install -dm755 "$pkgdir/usr/bin/"

  for _link in edit ex rview rvim vedit vi view vim; do
    ln -s nvim "$pkgdir/usr/bin/$_link"
  done

  # vimdiff --> nvim -d
  echo -e '#!/bin/sh\nexec vim -d "$@"' > "$pkgdir/usr/bin/vimdiff"
  chmod 755 "$pkgdir/usr/bin/vimdiff"
}
