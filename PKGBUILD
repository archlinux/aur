# Maintainer: Aaron Bockelie <aaronsb@gmail.com>
#
# vtium's terminfo entry, xterm-vtium, built from a release tag (ADR-1500
# D3, D8). Every console package from a release tag depends on it, and a
# machine that reaches a vtium console over ssh, with no console package
# installed, installs it alone so that programs there read the entry that
# TERM=xterm-vtium names. No package ships an entry named kmscon: the
# kmscon-terminfo package keeps that name. The maintainer signs the tag with
# the PGP key in validpgpkeys, and makepkg checks the tag's signature before
# it builds. Import the key once: gpg --import keys/pgp/*.asc, or
# gpg --recv-keys 33F9B54FD2A4B6A4110749B3BA464FC9847A832A.
#
# pkgver is the tag without its v and without the hyphen before a
# pre-release: v0.1.0-alpha.1 is 0.1.0alpha.1, which pacman sorts before
# 0.1.0 (vercmp).

pkgname=vtium-terminfo
_tag=v0.1.0-alpha.5
pkgver=0.1.0alpha.5
pkgrel=1
pkgdesc='The terminfo entry xterm-vtium, for sessions in vtium'
arch=('any')
url='https://github.com/vtium/vtium'
license=('MIT')
makedepends=('git' 'ncurses')
source=("vtium::git+https://github.com/vtium/vtium.git#tag=${_tag}?signed")
sha256sums=('SKIP')
validpgpkeys=('33F9B54FD2A4B6A4110749B3BA464FC9847A832A') # Aaron Bockelie <aaronsb@gmail.com>

# Everything below is the same in vtium-terminfo-git/PKGBUILD and
# vtium-terminfo/PKGBUILD; aur-publish refuses a package whose copy differs
# from the other's.

# vtium's Makefile compiles the entry with tic under its name xterm-vtium
# and stages it with the license, so which file goes where lives in vtium's
# tree (ADR-1500 D1, D3). make install-terminfo builds no console, so the
# package needs no cargo.
package() {
  make -C "$srcdir/vtium" PREFIX=/usr install-terminfo \
    DESTDIR="$pkgdir" PKGNAME="$pkgname"
}
