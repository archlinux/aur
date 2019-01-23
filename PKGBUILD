# Maintainer: Lucki <https://aur.archlinux.org/account/Lucki>
# Contributor: Chris Oelmueller <chris.oelmueller@gmail.com>
# Contributor: Thomas Kinnen <thomas.kinnen@gmail.com>
# Contributor: Thomas Kowaliczek-Schmer <thomas.kowaliczek@posteo.de>

pkgname=unknown-horizons-git
pkgver=2017.2.373.g8319a4773
pkgrel=2
pkgdesc="Open source real-time strategy game with the comfy Anno1602 feeling."
arch=('any')
url="http://www.unknown-horizons.org"
license=('GPL' 'CCPL')
depends=('fife' 'python-yaml' 'python-pillow' 'python-future')
makedepends=('git' 'intltool')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+https://github.com/${pkgname%-git}/${pkgname%-git}.git")
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe  --tags --match "[0-9][0-9][0-9][0-9]\.[0-9]" | sed 's/-/./g'
}

build() {
    cd "$srcdir/${pkgname%-git}"
    HOME=. python setup.py build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	HOME=. python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
