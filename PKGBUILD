# Maintainer: Jake Barnes <me@jakebarn.es>
pkgname=input-redirection-client-qt-git
pkgver=2.1.r8.g019cb9f
pkgrel=1
pkgdesc="Input redirection client for the 3DS using QtGamepad"
arch=('x86_64')
url="https://github.com/TuxSH/InputRedirectionClient-Qt"
license=('MIT')
provides=('input-redirection-client-qt')
conflicts=('input-redirection-client-qt')
makedepends=('git')
depends=('qt5-base' 'qt5-gamepad')
source=("git+https://github.com/TuxSH/InputRedirectionClient-Qt"
        "input-redirection-client-qt.desktop")
sha512sums=('SKIP'
            '66fa057c5c26ec6bee707a1990ff5a32c689354077a8bcf1067dd88a506de4b066472d8049fc00f4229c0b1d001f2f5764c1f37d5df0e33739cb650f06e958e6')

pkgver() {
  cd "$srcdir/InputRedirectionClient-Qt"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

build() {
  cd "$srcdir/InputRedirectionClient-Qt"
  qmake
  make
}

package() {
  install -Dm 755 "$srcdir/InputRedirectionClient-Qt/InputRedirectionClient-Qt" "$pkgdir/usr/bin/input-redirection-client-qt"
  install -Dm 644 "$srcdir/input-redirection-client-qt.desktop" "$pkgdir/usr/share/applications/input-redirection-client-qt.desktop"
}
