# Maintainer: Kevin MacMartin <prurigro at gmail dot com>
# Contributor: D. Can Celasun <dcelasun[at]gmail[dot]com>
# Contributor: Madek <gonzaloseguel@gmail.com>

_pkgname=pastie
pkgname=indicator-$_pkgname
pkgver=0.6.7.5
pkgrel=3
pkgdesc='GTK clipboard manager compatible with indicators.'
arch=('any')
url='https://launchpad.net/pastie'
license=('GPL')
depends=('python2' 'indicator-application' 'python2-keybinder2' 'python2-gnomevfs' 'python2-gconf')
install=$pkgname.install
source=(
  "https://launchpad.net/~hel-sheep/+archive/$_pkgname/+files/${_pkgname}_$pkgver~ppam1.tar.gz"
  "$_pkgname.svg"
)
sha512sums=(
  'e6e750c603b37debd872f3bace5d9bcef2c3d4a189012d7ceaa55d7b4f3b3a7d6fb613229761ff1295cbf566c2aab48ea0d3dc97a852a9bbbe6b528889141deb'
  '9095190ce33d2e68ba091f3cbaef1a3e2a042c68f938b858500d486e44406d059bd80be6fbefbbd065d2b70a5df967b4a1d1db47e3ef370c5a1bee608a4d5c24'
)

prepare(){
  cd ${_pkgname}_$pkgver
  for each in $(grep -ir "/usr/bin/env" | sed 's|:.*$||g'); do
      sed -i 's|/usr/bin/env python|/usr/bin/env python2|g' "$each"
  done
}

build() {
  cd ${_pkgname}_$pkgver
  PYTHON=python2 python2 setup.py build
}

package() {
  install -Dm644 $_pkgname.svg "$pkgdir/usr/share/pixmaps/$_pkgname.svg"
  cd ${_pkgname}_$pkgver
  python2 setup.py install --root="$pkgdir"
}
