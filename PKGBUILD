# Maintainer: Liganic <liganic-aur@gmx.net>
# Contributor: ajs124 <ajs@online.de>

pkgname=hawkthorne-journey-git
pkgver=v0.0.76_2492_g04ee9e8
pkgrel=1
pkgdesc="This 2d platformer is based on Community's Digital Estate Planning episode. It's built using the love game engine."
arch=('i686' 'x86_64')
url="https://github.com/kyleconroy/hawkthorne-journey"
license=('MIT+CCPL')
depends=('love')
makedepends=('git' 'zip' 'unzip')
source=('hawkthorne.desktop'
        $pkgname::git+https://github.com/hawkthorne/hawkthorne-journey.git)
sha256sums=('bb4d44614e868585b9079cdf1de5039c73bbfe433faf13c9fc7d3c27c254527e'
             SKIP)

pkgver() {
  cd $pkgname
  git describe | sed 's/-/_/g'
}

build() {
  cd $pkgname
  make love
}

package() {
  mkdir -p "$pkgdir/usr/bin/"
  echo -e '#!/bin/bash\nlove /usr/share/hawkthorne-journey/hawkthorne.love\n' > "$pkgdir/usr/bin/hawkthorne"
  chmod +x "$pkgdir/usr/bin/hawkthorne"

  install -Dm644 "$srcdir/hawkthorne.desktop" "$pkgdir/usr/share/applications/hawkthorne.desktop"
  install -Dm644 "$srcdir/$pkgname/src/images/menu/logo.png" "$pkgdir/usr/share/pixmaps/hawkthorne.png"
  install -dm755 "$pkgdir/usr/share/hawkthorne-journey/"
  install -Dm755 "$srcdir/$pkgname/build/hawkthorne.love" "$pkgdir/usr/share/hawkthorne-journey/"
}
