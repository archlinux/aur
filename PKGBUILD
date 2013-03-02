# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=dracut-antievilmaid-git
pkgver=20120925
pkgrel=1
pkgdesc="Dracut module and conf file to enable Anti Evil Maid support."
arch=('i686' 'x86_64')
url="http://www.qubes-os.org"
license=('GPL')
depends=('dracut' 'trousers')
makedepends=('git')
optdepends=("antievilmaid: Anti Evil Maid installation script")
provides=('dracut-antievilmaid')
conflicts=('dracut-antievilmaid')

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
  install -D -m0644 dracut-antievilmaid/anti-evil-maid.conf \
    "$pkgdir/etc/dracut.conf.d/anti-evil-maid.conf"

  install -d -m0755 "$pkgdir/usr/lib/dracut/modules.d"
  cp -r dracut-antievilmaid/90anti-evil-maid \
    "$pkgdir/usr/lib/dracut/modules.d/"
}

# vim:set ts=2 sw=2 et:
