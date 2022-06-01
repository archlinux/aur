# Maintainer: Jairo Abreu <jairoabreeu@gmail.com>
#Contributor Pieter Goetschalckx <3.14.e.ter at gmail dot com>

_pkgname=numix-folders
pkgname=$_pkgname-git
pkgver=r420.24e5f6c66
pkgrel=1
pkgdesc="Alternate folders for use with the Numix base icon theme."
arch=('any')
url="https://github.com/numixproject/numix-folders"
license=('GPL3')
depends=('numix-icon-theme-git')
optdepends=('python-gobject: GUI support'
            'gksu: GUI support')
makedepends=('git')
options=('!strip')
source=("git+https://github.com/numixproject/numix-folders"
        "$_pkgname.hook")
sha256sums=('SKIP'
            'f49b4d5153b054e32d846dded2c161a2a782c67f27f38b9d572f84189ed1c031')

pkgver() {
  cd numix-folders
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  echo "TryExec=gksudo" >> "$_pkgname.desktop"
}

package() {
  install -Dm 644 "$_pkgname.hook" "$pkgdir/usr/share/libalpm/hooks/$_pkgname.hook"

  cd "$_pkgname"

  install -dm 755 "$pkgdir/usr/share/$_pkgname"
  install -dm 755 "$pkgdir/usr/bin"

  install -Dm 644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  rm "$_pkgname.desktop"

  cp -dr --no-preserve='ownership' * "$pkgdir/usr/share/$_pkgname/"
  ln -s "/usr/share/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
