#Maintainer: Jarek Sedlacek <jareksedlacek@gmail.com

pkgname=pymetar
pkgver=0.19
pkgrel=1
pkgdesc="downloads the weather report for a given station ID, decodes it and the provides easy access to all the data found in the report"
arch=('i686' 'x86_64')
url="http://www.schwarzvogel.de/software-pymetar.shtml"
license=('GPL2')
depends=('python2>=2.7' )
source=("http://www.schwarzvogel.de/pkgs/$pkgname-$pkgver.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py build 
  sed -i 's/\/usr\/bin\/python -tt/\/usr\/bin\/env python2/' bin/pymetar
}

package(){
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -m0755 -d ${pkgdir}/usr/{bin,lib/python2.7/site-packages,share/${pkgname}} 
  chmod 0755 ${pkgdir}/usr/bin/ 
  install -m0644 -D PKG-INFO ${pkgdir}/usr/lib/python2.7/site-packages/${pkgname}-${pkgver}-py2.6.egg-info
  install -m0644 -D build/lib/pymetar.py ${pkgdir}/usr/lib/python2.7/site-packages/
  install -m0644 -D README librarydoc.txt ${pkgdir}/usr/share/${pkgname}
  install -m0755 -D bin/pymetar $pkgdir/usr/bin/

}

# vim:set ts=2 sw=2 et:
md5sums=('c1eb3afb5f55c414ffda4cdbb561928d')
