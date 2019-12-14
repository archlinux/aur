# Maintainer: Chris Billington <chrisjbillington at gmail dot com>
# Contributor: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=('git-nautilus-icons-common-py2-git')
pkgver=1.1.r1.15d76c1
pkgrel=1
pkgdesc="Common files for git-nautilus-icons, git-nemo-icons and git-caja-icons"
arch=('x86_64' 'i686')
url="https://github.com/chrisjbillington/git_nautilus_icons"
license=('BSD 2-Clause "Simplified"')
depends=('python2-gobject' 'python2-pathlib' 'python2-enum34')
makedepends=('python2-setuptools')
provides=("${pkgname%-git}" 'git-nautilus-icons-common')
conflicts=("${pkgname%-git}" 'git-nautilus-icons-common')
source=("git+https://github.com/chrisjbillington/git_nautilus_icons.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/git_nautilus_icons"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/git_nautilus_icons/git_nautilus_icons_common"
	python2 setup.py build
}

package() {
	cd "$srcdir/git_nautilus_icons/git_nautilus_icons_common"
	python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 "$srcdir/git_nautilus_icons/LICENSE" -t \
		"$pkgdir/usr/share/licenses/${pkgname%-git}"
}

