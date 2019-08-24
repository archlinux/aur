# Maintainer: Manuel Palenzuela <sadshinobi@protonmail.com>

pkgname=jrnl-git
pkgver=1.9.7.r16.g15ef974
pkgrel=1
pkgdesc="A simple command line journal application that stores your journal in a plain text file"
arch=('any')
url="https://jrnl.sh/"
license=('MIT')
depends=('python-asteval' 'python-dateutil' 'python-keyring' 'python-parsedatetime' \
         'python-pytz' 'python-tzlocal' 'python-pyaml' 'python-six' 'python-passlib' 'python-pyxdg' 'python-cryptography')
makedepends=('git')
conflicts=("${pkgname%-git}")
options=(!emptydirs)
source=("${pkgname%-git}::git+https://github.com/maebert/jrnl.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf '0.r%s.%s' \
      "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
