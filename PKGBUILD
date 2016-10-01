# Maintainer: seb@sebleblanc.net
pkgname=omxd-git
pkgdesc="daemon to maintain a playlist and play it via omxplayer"
url="https://github.com/subogero/omxd"

_name=omxd

arch=(armv7h)
pkgrel=1
pkgver=1.8.r5.ge824423

source=(omxd::git+https://github.com/subogero/omxd)
sha1sums=(SKIP)

pkgver() {
  cd "$srcdir/$_name"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_name"
  make DESTDIR="$pkgdir"
}

package() {
    cd "$srcdir/$_name"
    gzip < omxd.1 > omxd.1.gz
    
    install -Dm755 omxd "$pkgdir"/usr/bin/omxd
    install -Dm755 omxd.service "$pkgdir"/usr/lib/systemd/system/omxd.service
    install -Dm755 omxd.1.gz "$pkgdir"/usr/share/man/man1/omxd.1.gz

}
