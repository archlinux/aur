# Maintainer: Andrew Fischer <andrew at apastron dot co>
# Original author: Florian Schweikert <kelvan@ist-total.org>

pkgname=roundup
pkgver=2.3.0
pkgrel=2
pkgdesc="A simple-to-use and install issue-tracking system with command-line, web and e-mail interfaces. Highly customisable."
arch=('any')
url="https://www.roundup-tracker.org"
license=('PSF')
groups=()
depends=('python')
optdepends=('python-psycopg2: for postgresql backend')
source=("https://files.pythonhosted.org/packages/90/09/2ad041409f24346804a8e5f56f18c2203afa6c2e6e669d839f4649ef3585/roundup-$pkgver.tar.gz")
sha256sums=('0427b911f6509e83c3e571fb6d2997fc8949a7a156f6efc366a4da32301640b4')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < ../../mailer.py.patch
  patch -p1 < ../../cgitb.py.patch
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix="/usr" --root="$pkgdir" --optimize=1
}
