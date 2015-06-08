# Maintainer: jason ryan <jasonwryan@gmail.com>
# Contributor: totoloco <totoloco en gmail>

pkgname=vimprobable2-git
pkgver=2014.12.26.ga514968
pkgrel=2
pkgdesc="Lightweight, keyboard-driven, WebKit based browser with Vim keybinds."
arch=('i686' 'x86_64')
url="http://www.yllr.net/vimprobable/"
license=('MIT')
depends=('libwebkit>=1.1.11' 'gtk2' 'libsoup')
makedepends=('git')
provides=('vimprobable2')
conflicts=('vimprobable2')
_gitname="vimprobable"
_gitbranch="vimprobable2"/
source=(
    "$_gitname::git+http://git.code.sf.net/p/$_gitname/code"
    'config.h' 'keymap.h'
    )
md5sums=('SKIP'
         'e2845958a1ec3f4d77ae4bec87ef2e4d'
         '85e971541294c8e354b095b804fe8ac6')

pkgver() {
  cd "$srcdir/${_gitname}"
  git log -1 --format="%cd.g%h" --date=short | sed 's/-/./g'
}

prepare() {
  cp {config,keymap}.h "$srcdir/${_gitname}"
  cd "$srcdir/${_gitname}"
  sed -i 's:LIBS = gtk+-2.0 webkit-1.0 libsoup-2.4:LIBS = gtk+-2.0 webkit-1.0 libsoup-2.4 javascriptcoregtk-1.0:' Makefile
}

build() {
  cd "$srcdir/${_gitname}"
  make
}

package() {
  cd "$srcdir/$_gitname"
  make PREFIX=/usr MANDIR=/usr/share/man DESTDIR="$pkgdir" install
  mkdir -p "$pkgdir"/usr/share/licenses/"${_gitbranch}"
  chmod 0755  "$pkgdir"/usr/share/licenses/"${_gitbranch}"/
  install -m 644 LICENSE "$pkgdir"/usr/share/licenses/"${_gitbranch}"/LICENSE
}

# vim:set ts=2 sw=2 et:
