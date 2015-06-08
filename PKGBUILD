# Maintainer: Denis Kasak <reversed(moc.liamg@kasak.sined)>

pkgname=sierrachartfeed-git
project_name='sierrachartfeed'
pkgver=20130201
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
  cd "$srcdir/$project_name"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

build() {
  cp "$srcdir/setup.py" "$srcdir/$project_name/"

  sed -i "s/python/python2/g" $srcdir/$project_name/*.py
  sed -i "s/python/python2/g" $srcdir/$project_name/scid/*.py
}

package() {
  cd "$srcdir/$project_name"
  python2 setup.py install --root="$pkgdir/" --optimize=1

  mkdir -p "$pkgdir/usr/bin/"
  cp "$srcdir/$project_name/sierrachartfeed.py" "$pkgdir/usr/bin/sierrachartfeed"
  chmod a+x "$pkgdir/usr/bin/sierrachartfeed"
}

# vim:set ts=2 sw=2 et:
