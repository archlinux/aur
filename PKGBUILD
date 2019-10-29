# Maintainer: Jake Barnes <me@jakebarn.es>
pkgname=input-redirection-client-qt-git
pkgver=2.1.r6.g85439b9
pkgrel=1
pkgdesc="Input redirection client for the 3DS using QtGamepad"
arch=('x86_64')
url="https://github.com/TuxSH/InputRedirectionClient-Qt"
license=('MIT')
provides=('input-redirection-client-qt')
conflicts=('input-redirection-client-qt')
makedepends=('git')
depends=('qt5-base' 'qt5-gamepad')
source=("git://github.com/TuxSH/InputRedirectionClient-Qt"
        "input-redirection-client-qt.desktop")
md5sums=('SKIP'
         'a2ca494c5c1b38ac77ee9f44d586c89a')

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
