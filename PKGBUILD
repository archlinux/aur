# Maintainer: Steve Engledow <steve@engledow.me>
pkgname=amazon-workspaces-bin
pkgver=latest
pkgrel=2
pkgdesc="Amazon Workspace Client"
arch=('i686' 'x86_64')
url="https://clients.amazonworkspaces.com/"
license=('non-free')
depends=(
)
options=('staticlibs')
makedepends=(
  'binutils'
  'tar'
)
source=("workspaces-client.deb::https://d3nt0h4h6pmmc4.cloudfront.net/ubuntu/dists/bionic/main/binary-amd64/workspacesclient_3.0.0.200_amd64.deb")
sha1sums=("SKIP")

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
