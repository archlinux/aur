# Maintainer: Dpeta/Davepeta <jasprose@protonmail.com>
pkgname=pesterchum-git
pkgver=2.5.2.r0.g86ef71b
pkgrel=1
pkgdesc="Instant messaging client copying the look and feel of clients from Andrew Hussie's webcomic Homestuck."
arch=('x86_64')
url="https://github.com/Dpeta/pesterchum-alt-servers"
license=('GPL3')
depends=('python' 'python-pyqt6' 'python-pyqt6-sip' 'qt6-base' 'qt6-multimedia' 'qt6-wayland' 'ca-certificates')
optdepends=('python-certifi: fallback root certificate bundle')
makedepends=('git' 'coreutils')
conflicts=('pesterchum-bin')
source=("git+https://github.com/Dpeta/pesterchum-alt-servers"
        "pesterchum"
        "pesterchum.desktop")
b2sums=('SKIP'
        '8094cf6aa8e272b0fd838a37e486c22812d68a1a0f15aef768bae162956f52d7b3ad9e8d78d8688aafd3a51d4f681e002dd1b35f28c85da704699444c3cda0c0'
        'f0a457ee5bb55951ab1e5da847404c6c0d537757ac0b83979262fe97f9fe71a0079295f1bce54a4d44f8275689290cd68718b149240d4aa5148271629bcb44ca')

pkgver() {
  cd pesterchum-alt-servers
  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  mkdir -p "$pkgdir/opt/"
  cp -r "$srcdir/pesterchum-alt-servers" "$pkgdir/opt/"
  mv "$pkgdir/opt/pesterchum-alt-servers" "$pkgdir/opt/pesterchum"
  chmod 755 "$pkgdir/opt/pesterchum/pesterchum.py"
  
  # Install sh script for running from the command-line
  mkdir -p "$pkgdir/usr/bin/"
  install -Dm755 "pesterchum" "$pkgdir/usr/bin/"
  
  # Install desktop entry
  mkdir -p "$pkgdir/usr/share/applications/"
  install "pesterchum.desktop" "$pkgdir/usr/share/applications/"
}
