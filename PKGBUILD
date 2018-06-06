# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Chris Dunder <cdunder@gmail.com>
# Contributor: M Rawash <mrawash@gmail.com>
# Contributor: olvar <beren.olvar@gmail.com>
# Contributor: Andrew Antle <andrew.antle@gmail.com>
# Contributor: joyfulgirl <joyfulgirl@archlinux.us>
# Contributor: Jonathan Friedman <jonf@gojon.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: sidereus <francesco.serafin.3@gmail.com>

pkgname=stumpwm
pkgver=1.0.0
pkgrel=7
pkgdesc='Tiling, keyboard-driven window manager written in Common Lisp'
arch=('x86_64')
url='https://stumpwm.github.io/'
license=('GPL2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('084187569b27c669f10922aaaad31c0dd7d935c03048140cd19e6f0ea012788b')
makedepends=('cl-asdf' 'cl-ppcre' 'clx-git' 'common-lisp' 'gendesk')
optdepends=('xorg-xprop: for stumpish, the StumpWM Interactive Shell'
            'rlwrap: command completion and history in stumpish'
            'emacs: edit and eval stumpwm code with M-x stumpwm-mode'
            'alsa-utils: control the volume with amixer.lisp'
            'aumix: control the volume with aumix.lisp'
            'mpd: control mpd with mpd.lisp'
            'surfraw: surf the internet with surfraw.lisp'
            'clx-truetype: Xgt fonts with ttf-fonts.lisp')
options=('!strip' '!makeflags')

prepare() {
  gendesk -f -n -wm --pkgname="$pkgname" --name=StumpWM
  cd "$pkgname-$pkgver"
  ./autogen.sh
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --with-module-dir=/usr/share/stumpwm/contrib
  make -s
}

package() {
  destdir="$pkgdir" make -C "$pkgname-$pkgver" install
  install -Dm644 stumpwm.desktop "$pkgdir/usr/share/xsessions/stumpwm.desktop"
  install -Dm644 "$pkgname-$pkgver/sample-stumpwmrc.lisp" \
    "$pkgdir/usr/share/doc/$pkgname/stumpwmrc.example"
}

# vim: ts=2 sw=2 et:
