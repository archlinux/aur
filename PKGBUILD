# $Id$
# Maintainer: Julien Machiels <iamtimscampi@gmail.com>
# Contributor: Julien Machiels <iamtimscampi@gmail.com>

pkgname=metascrape-git
pkgver=0.1.1.r1.g70ba772
pkgrel=1
pkgdesc='A headless metadata scraper for media.'
arch=('any')
url='https://github.com/MrTimscampi/metascrape'
license=('GPL3')
provides=('metascrape')
conflicts=('metascrape')
depends=('python-appdirs' 'python-click' 'python-yapsy'
         'python-pillow' 'python-yaml' 'python-beautifulsoup4')
source=('git+https://github.com/MrTimscampi/metascrape.git')
sha256sums=('SKIP')

pkgver() {
  cd ${srcdir}/metascrape
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}


build() {
  cd ${srcdir}/metascrape
  python setup.py build
}

package() {
  cd ${srcdir}/metascrape
  python setup.py install --root=${pkgdir} --optimize=1 --skip-build
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
