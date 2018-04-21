# Maintainer: c6parmak <can6parmak <AT> gmail <DOT> com>

pkgname=oof2
pkgver='2.1.14'
pkgrel=1
pkgdesc="Finite element analysis of microstructures."
arch=('i686' 'x86_64')
url="http://www.ctcms.nist.gov/oof/oof2/index.html"
license=('custom')
depends=('python2' 'pygtk' 'libgnomecanvas' 'libmagick6' 'lapack' 'gperftools')
source=("https://www.ctcms.nist.gov/oof/oof2/source/${pkgname}-${pkgver}.tar.gz"
        "LICENSE")
md5sums=('c2c9ece407df3dd0e24af0da9745104e'
         'c1d808bd883c2e0a30b687e3fcec4847')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export PKG_CONFIG_PATH=/usr/lib/imagemagick6/pkgconfig
  python2 setup.py build
}
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --prefix=/usr --root="$pkgdir" || return 1
  install -m 644 -D ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
