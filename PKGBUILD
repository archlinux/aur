# Maintainer: maz-1 <ohmygod19993 at gmail dot com>
pkgname=hoststool
pkgver=1.9.8
pkgrel=1
pkgdesc="Hosts tool."
arch=(i686 x86_64)
url="https://code.google.com/p/huhamhire-hosts/"
license=('GPL')
depends=('python2-pyqt4' 'gksu')
source=("https://huhamhire-hosts.googlecode.com/git-history/gh-pages/release/HostsTool-x11-gpl-${pkgver}-SE.tar.gz" "hoststool.png" "hoststool.desktop")
md5sums=('982eb0fedc5c3b076326eaf06fc87c23' 
        'b79a5fd9df05c3e384f37b3f68cef92d' 
        'bea986c720b09e18095d022c86b4734d')

prepare() {
    cd  "$srcdir/HostsTool-x11-gpl-${pkgver}-SE"
    find -name '*.py' | xargs sed -i 's|#!/usr/bin/python$|#!/usr/bin/env python2|'
}

package() {
  install -dm 755 "$pkgdir/usr/"{share,bin} 
  cp -r "$srcdir/HostsTool-x11-gpl-${pkgver}-SE" "$pkgdir/usr/share/hoststool"
  echo '#!/bin/sh' > "$pkgdir/usr/bin/hoststool"
  echo 'cd /usr/share/hoststool' >> "$pkgdir/usr/bin/hoststool"
  echo 'exec python2 hoststool.py' >> "$pkgdir/usr/bin/hoststool"
  chmod +x "$pkgdir/usr/bin/hoststool"
  install -Dm 644 "$srcdir/hoststool.png" "${pkgdir}/usr/share/icons/hoststool.png"
  install -Dm 755 "$srcdir/hoststool.desktop" "${pkgdir}/usr/share/applications/hoststool.desktop"
}

