# Contributor: Bug <Bug2000@gmail.com>
# Maintainer: Bug <Bug2000@gmail.com>
pkgname=inadyn-opendns
pkgver=1.99
pkgrel=6
pkgdesc="Simple dynamic DNS client with SSL support"
arch=('i686' 'x86_64')
url="https://support.opendns.com/entries/24889200-Dynamic-IP-Addresses-Technical-Detail-and-FAQ"
license=('GPL')
makedepends=('unzip')
depends=('curl')
conflicts=('inadyn')
provides=('inadyn')
backup='etc/inadyn.conf'
install='inadyn-opendns.install'
source=("http://d295hzzivaok4k.cloudfront.net/wp-content/uploads/2014/01/inadyn.source.v$pkgver.zip"
        'inadyn.service')
sha256sums=('0360fbe8fd4bd184d015d577361ef2a93226648a2bb7b60546b385025eceaf88'
            '993180c3452f34e66f2b420f9b5e28fdcb4ed5fb4c28a6b51afbb5c025991cb7')

build() {
  cd "$srcdir/inadyn.source.v$pkgver"
  make || return 1
}
package(){
  cd "$srcdir/inadyn.source.v$pkgver"
  install -Dm755 bin/linux/inadyn $pkgdir/usr/bin/inadyn
  install -Dm644 man/inadyn.8 $pkgdir/usr/share/man/man8/inadyn.8
  install -Dm644 man/inadyn.conf.5 $pkgdir/usr/share/man/man5/inadyn.conf.5
  install -Dm644 readme.html $pkgdir/usr/share/doc/inadyn/readme.html
  install -Dm644 $srcdir/inadyn.service $pkgdir/usr/lib/systemd/system/inadyn.service
  install -Dm644 inadyn.conf $pkgdir/etc/inadyn.conf
}
