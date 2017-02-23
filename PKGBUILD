# Maintainer: Walwe <aur@walwe.de>
pkgname=md2pdf
pkgver=v0.0.2.r0.g9631443
pkgrel=1
pkgdesc="A Python Markdown to PDF Converter"
arch=('any')
url="https://github.com/walwe/${pkgname}"
license=('MIT')
depends=('python-click' 'wkhtmltopdf' 'python-markdown2')
makedepends=('python' 'python-setuptools' 'git')
source=("git+${url}")
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
  cd "${srcdir}/${pkgname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}"
  python setup.py install --root="${pkgdir}"
  
  mkdir ${pkgdir}/usr/bin
  echo -e '#!/usr/bin/bash\n\npython -m md2pdf "$@"' > ${pkgdir}/usr/bin/md2pdf
  chmod +x ${pkgdir}/usr/bin/md2pdf
}

# vim:set ts=2 sw=2 et:
