# Contributor: Chris Dunder <echo Y2R1bmRlckBnbWFpbC5jb20K | base64 -d>
# Contributor: M Rawash <mrawash@gmail.com>
# Contributor: olvar <beren dot olvar (at) gmail dot com>
# Contributor: Andrew Antle <andrew dot antle at gmail dot com>
# Contributor: joyfulgirl <joyfulgirl (at) archlinux.us>
# Contributor: Jonathan Friedman <jonf@gojon.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=stumpwm
pkgver=1.0.0
pkgrel=3
pkgdesc="A tiling, keyboard-driven window manager written in common lisp"
arch=('i686' 'x86_64')
url="https://stumpwm.github.io"
license=('GPL2')
provides=('stumpwm')

source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/v1.0.0.tar.gz"
       https://github.com/stumpwm/stumpwm-contrib.git)
md5sums=('40b3def66afc2aacff818936e06ce74c'
         'c4e10706feee5799fb97f6531db3592a')

makedepends=('common-lisp' 'cl-asdf' 'clx-git' 'cl-ppcre')
optdepends=('xorg-xprop: for stumpish (StumpWM Interactive Shell)'
            'rlwrap: for stumpish completion and history'
            'emacs: Edit and eval stumpwm code with M-x stumpwm-mode'
            'alsa-utils: for amixer.lisp (control audio volume)'
            'aumix: for aumix.lisp (control audio volume)'
            'mpd: for mpd.lisp (control the mpd)'
            'surfraw: for surfraw.lisp (surf the Internet)'
            'clx-truetype: for ttf-fonts.lisp (Xft fonts)')

# Binary will not run other
options=(!strip)  # Thanks to sidereus for pointing this out

build() {
  cd ${pkgname}-${pkgver}
  ./autogen.sh
  ./configure  --prefix=/usr --with-module-dir=/usr/share/stumpwm/contrib
  make
} 

package() {
  cd ${pkgname}-${pkgver}

  make destdir="$pkgdir/" install

  install -Dm 644 sample-stumpwmrc.lisp \
	  ${pkgdir}/usr/share/${_pkgname}/stumpwmrc.sample
}
