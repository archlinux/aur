# Maintainer: Filth <filth [at] wagn [dot] me>

_pkgname=mari0
pkgname="$_pkgname-git"
pkgver=1.6.2.r27.g57829fd
pkgrel=1
pkgdesc="Recreation of Super Mario Bros, with portals"
arch=('any')
options=("!strip" "!debug")
url="https://stabyourself.net/mari0/"
license=('MIT')
depends=('love' 'sh')
makedepends=('git')
source=("$_pkgname.desktop"
        "git+https://github.com/Stabyourself/mari0.git")
b2sums=('fd257edab80a4008b3a4b1b3d831bbd20fa4c641c97a2ba09d36139fb772cb6d72f3595aef5766c937e63a1421e67b3b1c965baf7f11fa1a99718d411ddf918c'
        'SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  install -dm755 "$pkgdir/usr/share/games/$_pkgname"
  install -dm755 "$pkgdir/usr/bin"

  install -D -m644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -D -m644 "$_pkgname/_DO_NOT_INCLUDE/icon.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
  cp -r $_pkgname/* "$pkgdir/usr/share/games/$_pkgname"

  # Cleanup unnecessary files
  rm -rf "$pkgdir/usr/share/games/$_pkgname/_DO_NOT_INCLUDE"

  echo "#!/bin/sh
cd /usr/share/games/${_pkgname}
love . \"\$@\"" > "${pkgdir}/usr/bin/${_pkgname}"
  chmod +x "${pkgdir}/usr/bin/${_pkgname}"
}
