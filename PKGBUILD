# Maintainer: Mike Nagie <echo 'cHJvbWlrZTE5ODdAZ21haWwuY29tCg==' | base64 -d>
# Maintainer: Ingo Gottwald <in dot gottwald at gmail dot com>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=python2-eventlib
pkgver=0.2.2
pkgrel=1
pkgdesc="Coroutine-based networking library"
arch=('any')
url="http://www.icanblink.com"
license=('custom:MIT')
depends=('python2-greenlet' 'python2-pyopenssl')
source=("http://download.ag-projects.com/SipClient/${pkgname/2}-$pkgver.tar.gz")

build() {
  cd "$srcdir/${pkgname/2}-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname/2}-$pkgver"
  python2 setup.py install --root="$pkgdir/"

  # python2 fix
  sed -i "s|bin/python|&2|" `grep -rl bin/python "$pkgdir"`

  # license
  install -Dm644 debian/copyright \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
md5sums=('53781163807002d1193aff16041c540f')
