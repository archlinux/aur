# Maintainer: Tobias Frilling <tobias@frilling-online.de>
pkgname=jrnl-git
pkgver=1.9.7.r16.g15ef974
pkgrel=1
pkgdesc="A simple command line journal application that stores your journal in a plain text file"
arch=('any')
url="http://maebert.github.io/jrnl/"
license=('MIT')
depends=('python' 'python-dateutil' 'python-keyring' 'python-parsedatetime' \
         'python-pytz' 'python-tzlocal')
makedepends=('git')
conflicts=("${pkgname%-git}")
options=(!emptydirs)
source=("${pkgname%-git}::git+https://github.com/maebert/jrnl.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/${pkgname%-git}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
