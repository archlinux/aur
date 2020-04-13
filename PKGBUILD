# Maintainer: elvirolo <elvirolo@posteo.net>

pkgname=pass-audit-git
pkgrel=1
pkgver=v1.0.1.r28.e08d707
pkgdesc="A pass extension for auditing your password repository."
arch=('any')
url="https://github.com/roddhjav/pass-audit"
license=('GPL3')
depends=(
  'pass'
  'python'
  'python-requests'
  'python-zxcvbn')
makedepends=('git' 'python-setuptools')
provides=('pass-audit')
conflicts=('pass-audit')
source=('pass-audit::git+https://github.com/roddhjav/pass-audit')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "${pkgname%-git}"
  make
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
