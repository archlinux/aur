# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Co-Maintainer: Chris Billington <chrisjbillington at gmail dot com>
pkgname=git-nautilus-icons-common-git
pkgver=1.1.1.r9.eaf4fbf
pkgrel=1
pkgdesc="Common files for git-nautilus-icons, git-nemo-icons and git-caja-icons"
arch=('any')
url="https://github.com/chrisjbillington/git_nautilus_icons"
license=('BSD 2-Clause "Simplified"')
depends=('python-gobject')
makedepends=('git' 'python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/chrisjbillington/git_nautilus_icons.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/git_nautilus_icons"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/git_nautilus_icons/git_nautilus_icons_common"
	python setup.py build
}

package() {
	cd "$srcdir/git_nautilus_icons/git_nautilus_icons_common"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

	install -Dm644 "$srcdir/git_nautilus_icons/LICENSE" -t \
		"$pkgdir/usr/share/licenses/${pkgname%-git}"
}

