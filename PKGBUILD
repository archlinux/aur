# Maintainer: hiruocha <hiruocha[at]outlook[dot]com>
# Contributor: Doug Newgard <scimmia at archlinux dot info>
# Contributor: Tomas Storck <storcktomas@gmail.com>
# Contributor: Tom Richards <tom@tomrichards.net>

pkgname=ex-vi-vim-compat
pkgver=1
pkgrel=1
pkgdesc='Runs neovim if vi or vim is called'
arch=('any')
depends=('neovim' 'sh')
provides=('vim' 'vi')
conflicts=('vim' 'vi')

package() {
  install -dm755 "$pkgdir/usr/bin/"
  cd "$pkgdir/usr/bin/"

  echo -e '#!/bin/sh\nexec nvim -e "$@"'  > ex
  echo -e '#!/bin/sh\nexec nvim -R "$@"'  > view
  echo -e '#!/bin/sh\nexec nvim -d "$@"'  > vimdiff
  echo -e '#!/bin/sh\nexec nvim --clean "$@"'  > vi
  chmod 755 *

  for _link in edit vedit vim; do
    ln -s nvim $_link
  done
}
