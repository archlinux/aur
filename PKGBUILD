# Maintainer: Steve Engledow <steve@engledow.me>
pkgname=amazon-workspaces-bin
pkgver=3.0.8.529
pkgrel=2
pkgdesc='Amazon Workspace Client'
arch=('i686' 'x86_64')
url="https://clients.amazonworkspaces.com/"
license=('non-free')
depends=(
    'gtk3'
    'webkit2gtk'
)
options=('staticlibs')
makedepends=(
  'binutils'
  'tar'
)
source=("$pkgname-$pkgver.deb::https://d3nt0h4h6pmmc4.cloudfront.net/workspacesclient_amd64.deb")
sha256sums=('803da8f95949c141ec2b6bd942cd8684a306d55cfd535f8d5f18ee2655c0f258')

build() {
    cd "$srcdir"
    ar x "$pkgname-$pkgver.deb"
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
