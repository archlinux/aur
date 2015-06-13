# Maintainer: Muflone <webreg@vbsimple.net>

pkgname=dirindex
pkgver=0.3.1
pkgrel=3
pkgdesc="Create an HTML index starting from a directory using templates for the resulting pages"
arch=(any)
url="https://github.com/muflone/dirindex"
license=(GPL3)
depends=('python2' 'python-magic')
source=("$pkgname-$pkgver.tar.gz::https://github.com/muflone/$pkgname/tarball/$pkgver")
md5sums=('b7d0621d034e3988940f79ff157f34cb')
noextract=("$pkgname-$pkgver.tar.gz")

build() {
  cd "$srcdir"
  [ -d "$pkgname-$pkgver" ] && rm -rf "$pkgname-$pkgver"
  mkdir "$pkgname-$pkgver"
  tar xzf "$pkgname-$pkgver.tar.gz" -C "$pkgname-$pkgver/" --strip-components=1
  find "$pkgname-$pkgver/templates/" -type f -print0 | xargs --null chmod 644
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/$pkgname"
  install -m 755 "dirindex.py" "$pkgdir/usr/bin/dirindex"
  cp -r templates "$pkgdir/usr/share/$pkgname/templates"
}

