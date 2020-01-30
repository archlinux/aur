# Maintainer: Steve Engledow <steve@engledow.me>
pkgname=amazon-workspaces-bin
pkgver=3.0.1.234
pkgrel=4
pkgdesc='Amazon Workspace Client'
arch=('i686' 'x86_64')
url="https://clients.amazonworkspaces.com/"
license=('non-free')
depends=(
    'gtk3'
)
options=('staticlibs')
makedepends=(
  'binutils'
  'tar'
)
source=('workspaces-client.deb::https://d3nt0h4h6pmmc4.cloudfront.net/workspacesclient_amd64.deb')
sha256sums=('339e1d861e67f5e8a3ee46c408a962b4c86615914098e806c8d0ed6a88871276')

build() {
    cd "$srcdir"
    ar x workspaces-client.deb
    tar axvf data.tar.xz
}

package() {
  mkdir -p $pkgdir/usr/share/amazon-workspaces
  mkdir -p $pkgdir/usr/bin

  # Icons
  cp -a $srcdir/usr/share/* $pkgdir/usr/share/

  # Binary
  cp -a $srcdir/opt/workspacesclient/* $pkgdir/usr/share/amazon-workspaces/

  # Launcher
  ln -s /usr/share/amazon-workspaces/workspacesclient $pkgdir/usr/bin/amazon-workspaces
}
