# shellcheck shell=bash
# -*- sh -*-

#  Maintainer: Heine Otte <heinep@gmail.com>
# Contributor: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

_gitname='velvet'
_pkgname="$_gitname-mux"
pkgname="$_pkgname-git"
pkgdesc='Scriptable terminal multiplexer which draws heavy inspiration from tmux and neovim (development version)'
pkgver=0.4.0.r139.g9a22bed
pkgrel=1
epoch=
url='https://codeberg.org/alexnlarsen/velvet'
arch=('aarch64' 'x86_64')
license=('GPL-3.0-or-later')
makedepends=('git' 'make')
depends=('glibc' 'libutf8proc' 'luajit')
provides=("$_pkgname")
conflicts=("$_gitname-git" "${provides[@]}")
replaces=('velvet-git')
options=('!emptydirs')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"

  git describe --long --tags \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  make PREFIX="$pkgdir/usr" -C "$srcdir/$_gitname"
}

package() {
  make PREFIX="$pkgdir/usr" -C "$srcdir/$_gitname" install
}

# eof
