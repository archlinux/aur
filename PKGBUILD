# Maintainer: Andrew Fischer <andrew at apastron dot co>
# Original author: Florian Schweikert <kelvan@ist-total.org>

pkgname=roundup
pkgver=2.1.0
pkgrel=1
pkgdesc="A simple-to-use and install issue-tracking system with command-line, web and e-mail interfaces. Highly customisable."
arch=('any')
url="https://www.roundup-tracker.org"
license=('PSF')
groups=()
depends=('python')
optdepends=('python-psycopg2: for postgresql backend')
source=("https://files.pythonhosted.org/packages/80/6d/3ccdd66551bb89b90758add63b8814b516d7471348675aa564aab032341f/roundup-$pkgver.tar.gz")
sha256sums=('1c78ec2ead7849418c827d2432208ba27babfb3e6a56df955b5746c501931f18')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < ../../mailgw.py.patch
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix="/usr" --root="$pkgdir" --optimize=1
}
