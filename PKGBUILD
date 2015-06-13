# Maintainer: Denis Kasak <dkasak|AT|termina.org.uk>

pkgname=sierrachartfeed-git
_projectname='sierrachartfeed'
pkgver=20130819
pkgrel=1
pkgdesc="Sierrachart feed bridge for bitcoincharts.com"
arch=('any')
url="https://github.com/slush0/sierrachartfeed"
license=('unknown')
depends=('python2')
makedepends=('git')
source=('setup.py'
        'git+git://github.com/slush0/sierrachartfeed.git')
md5sums=('36a8b2cff2dd3b397daa683dc00d7075'
         'SKIP')

pkgver() {
  cd "$srcdir/$_projectname"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

build() {
  cp "$srcdir/setup.py" "$srcdir/$_projectname/"

  sed -i "s/python/python2/g" $srcdir/$_projectname/*.py
  sed -i "s/python/python2/g" $srcdir/$_projectname/scid/*.py
}

package() {
  cd "$srcdir/$_projectname"
  python2 setup.py install --root="$pkgdir/" --optimize=1

  mkdir -p "$pkgdir/usr/bin/"
  cp "$srcdir/$_projectname/sierrachartfeed.py" "$pkgdir/usr/bin/sierrachartfeed"
  chmod a+x "$pkgdir/usr/bin/sierrachartfeed"
}

# vim:set ts=2 sw=2 et:
