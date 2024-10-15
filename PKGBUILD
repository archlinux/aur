# Maintainer: Kurt Kot <kurtkot at gmail dot com>
pkgdesc='Terminfo files for the eat terminal emulator'
pkgname=eat-terminfo-git
pkgver=0.9.4.r5.g3a6f418
pkgrel=1
provides=('eat-terminfo')
arch=('any')
url=https://codeberg.org/akib/emacs-eat.git
license=(mit)
makedepends=('git' 'ncurses')
source=(git+https://codeberg.org/akib/emacs-eat.git)
sha256sums=('SKIP')

pkgver() {
  cd emacs-eat
  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd emacs-eat
  mkdir -p build
  tic -x -o build -e eat-256color,eat-color,eat-mono,eat-truecolor eat.ti
}

package() {
  cd emacs-eat
  install -dm 755 "${pkgdir}/usr/share/terminfo/e"
  cp build/e/eat-{256color,color,mono,truecolor} "${pkgdir}/usr/share/terminfo/e/"
}
