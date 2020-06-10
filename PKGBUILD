# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: ConnorBehan <connor.behan@gmail.com>

pkgname=sk1
pkgver=2.0rc4
pkgrel=4
epoch=1
pkgdesc="Professional quality illustration program"
arch=(x86_64)
url="https://sk1project.net/"
depends=('lcms2' 'imagemagick' 'python2-cairo' 'python2-pillow' 'python2-pycups' 'python2-reportlab' 'python2-wxpython3')
license=('GPL3')
source=("https://downloads.sk1project.net/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz"
        sk1.appdata.xml)
sha256sums=('65ef0856389d3972e758d55eea33357a4bccec8b97d95eb8dc6be186a7956063'
            'a42a6fd243f3866f03210b4d31c66451ff55b70948b52d7e656f3ca4447a675c')

build() {
  cd $pkgname-$pkgver
  python2 setup-sk1.py build
}

package() {
  cd $pkgname-$pkgver
  python2 setup-sk1.py install --root="$pkgdir" --optimize=1
  find "$pkgdir"/usr/{lib,share} -type f | xargs chmod 644
  install -Dm644 src/sk1.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/sk1.png"
  install -Dm644 ../$pkgname.appdata.xml "$pkgdir/usr/share/metainfo/$pkgname.appdata.xml"
  rm -r "$pkgdir"/usr/share/pixmaps
}
