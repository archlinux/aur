# Maintainer: Łukasz Pożarlik <lpozarlik@gmail.com>

pkgname=('python-timezonefinder' 'python2-timezonefinder')
pkgdesc="Fast and lightweight project for looking up the timezone for a given lat/lng"
pkgver=4.1.0
pkgrel=1
url="https://github.com/MrMinimal64/timezonefinder"
license=('MIT')
arch=('any')
makedepends=('python' 
  'python-setuptools' 
  'python2' 
  'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/t/timezonefinder/timezonefinder-${pkgver}.tar.gz"
"python3.patch")
sha256sums=('0569558a0343e5c0ff6a6d92dc30725ddedec13b6b57fa642c70121dd33496a3'
            '2fc4a9ecc413c09c4eddfbfe8c71952d9b7e608f415f3d8ba295988e30786288')

build() {
  cp -r ${srcdir}/timezonefinder-${pkgver} ${srcdir}/timezonefinder-${pkgver}-py2

  cd ${srcdir}/timezonefinder-${pkgver}
  python setup.py build
  
  patch -p1 -i "${srcdir}/python3.patch"
  
  cd ${srcdir}/timezonefinder-${pkgver}-py2
  python2 setup.py build
}

package_python-timezonefinder() {
  depends=('python-numpy')
  cd ${srcdir}/timezonefinder-${pkgver}
  python setup.py install --prefix=/usr --root=${pkgdir}
  install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

package_python2-timezonefinder() {
  depends=('python2-numpy')
  cd ${srcdir}/timezonefinder-${pkgver}-py2
  python2 setup.py install --prefix=/usr --root=${pkgdir}
  install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim:set ts=2 sw=2 et:

