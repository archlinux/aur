# Maintainer: Stunts <f.pinamartins@gmail.com>
_pkgname=landslide
pkgname=${_pkgname}-git
pkgver=0.4.0.r414.ga76d4e2
pkgrel=1
pkgdesc="Generate html5 slideshow from Markdown or reStructuredText sources"
arch=(any)
url="http://github.com/adamzap/landslide"
license=('Apache License')
depends=('python' 'python-pygments' 'python-markdown' 'python-jinja' 'python-docutils' 'python-six')
makedepends=('python-distribute')
optdepends=('prince-bin')
conflicts=(landslide)
source=('git+https://github.com/adamzap/landslide.git')
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_pkgname}
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${srcdir}/${_pkgname}
  sed -i '25,31s/==/>=/' setup.py
  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}
  python setup.py install --prefix=/usr --root="${pkgdir}"
  find "${pkgdir}/" -name '*.pyc' -delete
  find "${pkgdir}/" -type d -empty -delete
}
