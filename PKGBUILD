# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Ihor Novikov <sk1.project.org@gmail.com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: ConnorBehan <connor.behan@gmail.com>

pkgname=sk1
pkgver=2.0rc5
pkgrel=1
epoch=1
pkgdesc="Open source vector graphics editor for prepress"
url="https://sk1project.net/"
arch=(x86_64)
license=(GPL3)
depends=(lcms2 cairo imagemagick pango  python2-cairo python2-pillow
         python2-pycups python2-reportlab python2-wxpython3)
source=("https://downloads.sk1project.net/sk1/sk1-${pkgver}.tar.gz"
        sk1.appdata.xml)
sha256sums=('1f70dd490a62aad97118454bd18f13c3459dcbd910823835404d6b639f7ef637'
            'a42a6fd243f3866f03210b4d31c66451ff55b70948b52d7e656f3ca4447a675c')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 ../$pkgname.appdata.xml "$pkgdir/usr/share/metainfo/$pkgname.appdata.xml"
}

