# Maintainer: masutu <masutu dot arch at gmail dot com>
_gitname=astroquery
pkgname=python2-astroquery-git
pkgver=v0.3.6.r1063.g4bdc1ea3
pkgver() {
  cd "$_gitname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
pkgrel=1
pkgdesc="Set of tools for querying astronomical web forms and databases"
arch=('x86_64')
url="http://astroquery.readthedocs.org/en/latest/"
license=('BSD')
depends=('python2>=2.7' 'python2-numpy>=1.10' 'python2-astropy>=1.3' 'python2-requests' 'python2-keyring' 'python2-beautifulsoup4' 'python2-html5lib' 'python2-astropy-helpers')
provides=("python2-astroquery")
conflicts=("python2-astroquery")
makedepends=('cython2')
source=(git://github.com/astropy/astroquery)
md5sums=(SKIP)


build() {
  cd "$_gitname"
  python2 setup.py build --use-system-libraries --use-system-astropy-helpers --offline
}


package() {
  cd "$_gitname"
  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" licenses/*
  python2 setup.py install --offline --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-astropy-helpers
}
