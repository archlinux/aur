# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=antievilmaid-git
pkgver=20121016
pkgrel=1
pkgdesc="Anti Evil Maid for initramfs-based systems."
arch=('i686' 'x86_64')
url="http://www.qubes-os.org"
license=('GPL')
depends=('antievilmaid-trustedgrub' 'parted')
optdepends=('dracut-antievilmaid-git: Dracut hook for Anti Evil Maid'
            'mkinitcpio-antievilmaid: mkinitcpio hook for Anti Evil Maid (recommended)')
makedepends=('git')
provides=('antievilmaid')
conflicts=('antievilmaid')

_gitroot=git://git.qubes-os.org/joanna/antievilmaid.git
_gitname=antievilmaid

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
}

package() {
  cd "$srcdir/$_gitname"

  install -d -m0755 "$pkgdir/usr/lib/antievilmaid"
  install -m0755 antievilmaid_install "$pkgdir/usr/lib/antievilmaid/"
  install -m0644 README "$pkgdir/usr/lib/antievilmaid/"
}

# vim:set ts=2 sw=2 et:
