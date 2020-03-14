# Maintainer: beelzy

pkgname=kame-editor-git
pkgver=1.2.7
pkgrel=1
arch=('i686' 'x86_64')
url="https://gitlab.com/beelzy/kame-editor"
license=('GPL3')
pkgdesc='A 3DS theme editor made with Qt5'
depends=('qt5-base' 'portaudio' 'kame-tools-git' 'rstmcpp-git' 'vgmstream-kode54-git')
makedepends=('git')

_gitroot='https://gitlab.com/beelzy/kame-editor.git'
_gitname='kame-editor'

source=("${_gitname}::git+${_gitroot}")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    cat kame-editor.pro | grep -o -E "^VERSION = .*" | grep -oE "([0-9\.a-z]+)"
}

build() {
    cd "$srcdir/$_gitname"
    qmake
    make

    "$srcdir/$_gitname/buildicons.sh"
}

package() {
  install -D "$srcdir/$_gitname/build/kame-editor" "$pkgdir/usr/bin/kame-editor"

  mkdir -p "$pkgdir/usr/share/icons/hicolor"
  mkdir -p "$pkgdir/usr/share/applications"

  cp "$srcdir/$_gitname/kame-editor.desktop" "$pkgdir/usr/share/applications/kame-editor.desktop"
  cp -a "$srcdir/$_gitname/icons/." "$pkgdir/usr/share/icons/hicolor"
  cp -a "$srcdir/$_gitname/icons/." "$pkgdir/usr/share/icons/gnome"
}
