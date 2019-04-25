# Maintainer: Kyle Sferrazza <kyle.sferrazza@gmail.com>
# Contriubutor: robertfoster

# This file is part of BlackArch Linux ( https://www.blackarch.org/ ).
# See COPYING for license details.

pkgname=wifiphisher-git
_pkgname=wifiphisher
pkgver=728.1b79d78
pkgrel=1
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
provides=('wifiphisher')
conflicts=('wifiphisher')
source=('git+https://github.com/sophron/wifiphisher.git'
        'setup.patch')
sha512sums=('SKIP'
            'b25a7382f476afe1717afdf0638db17b0c7b3304e1092981d538f861586226e825502df3b8c916a368caee886b1bf7c3baa136b12acf657d4ee76b7993e928b0')

pkgver() {
  cd $_pkgname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "$_pkgname"
  cat "$srcdir/setup.patch" | patch -p1
}

package() {
  cd "$_pkgname"
  install -dm 755 "$pkgdir/usr/bin"
  install -dm 755 "$pkgdir/usr/share/$_pkgname"

  python2 setup.py install --root="$pkgdir"

  install -Dm 644 -t "$pkgdir/usr/share/doc/$_pkgname/" *.md
  install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
