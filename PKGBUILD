# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=git-lab-git
pkgver=r39.268af55
pkgrel=1
pkgdesc="Subcommand for git providing an arcanist-style interface to GitLab."
arch=('any')
url="https://invent.kde.org/jbbgameich/git-lab"
license=('GPL')
depends=('python-gitlab' 'python-gitpython')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://invent.kde.org/jbbgameich/git-lab.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
