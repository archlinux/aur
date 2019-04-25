# Maintainer: Kyle Sferrazza <kyle.sferrazza@gmail.com>
# Contributor: robertfoster

# This file is part of BlackArch Linux ( http://blackarch.org ).
# See COPYING for license details.

pkgname=wifiphisher
pkgver=1.4
pkgrel=2
groups=('blackarch' 'blackarch-wireless' 'blackarch-social')
pkgdesc='Fast automated phishing attacks against WPA networks.'
arch=('any')
url='https://github.com/sophron/wifiphisher'
license=('MIT')
depends=('python2' 'python2-httplib2' 'python2-scapy' 'aircrack-ng'
         'python2-pyopenssl' 'python2-pyric' 'python2-blessings'
         'python2-pbkdf2' 'python2-tornado' 'hostapd' 'dnsmasq'
         'python2-dbus' 'roguehostapd-git')
makedepends=('git' 'python2-setuptools')
source=("https://github.com/sophron/wifiphisher/archive/v$pkgver.tar.gz"
        'setup.patch')
sha512sums=('93629b0d9c88ebcb6c069c84eb9518a4382bc27e28ce7b8b83fc5d1d06ad3c479df2bb52b8da3c20e9abcffa4500b54733f4e872ea8b1e149ee0423f197ed810'
            '60a25cde29493753f2ca973c5b35682f2f2af9a9aeac0673bf9e6cf841b7d127000483f9ce1813d2c3420883e71d10e9e710efb4b6630d7bdf9c6558048d0512')

prepare() {
  cd "$pkgname-$pkgver"
  cat "$srcdir/setup.patch" | patch -p1
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
  install -dm 755 "$pkgdir/usr/bin"
  install -dm 755 "$pkgdir/usr/share/$_pkgname"

  python2 setup.py install --root="$pkgdir"

  install -Dm 644 -t "$pkgdir/usr/share/doc/$_pkgname/" *.md
  install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
