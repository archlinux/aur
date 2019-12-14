# Maintainer: Chris Billington <chrisjbillington at gmail dot com>
# Contributor: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=('git-nautilus-icons-py2-git')
pkgver=1.1.r1.15d76c1
pkgrel=2
pkgdesc="A Nautilus Python extension to overlay icons on files in git repositories (Python 2 version)"
arch=('x86_64' 'i686')
url="https://github.com/chrisjbillington/git_nautilus_icons"
license=('BSD 2-Clause "Simplified"')
depends=('git-nautilus-icons-common-py2' 'python2-nautilus')
makedepends=('python2-setuptools')
provides=("${pkgname%-git}" 'git-nautilus-icons')
conflicts=("${pkgname%-git}" 'git-nautilus-icons')
source=("git+https://github.com/chrisjbillington/git_nautilus_icons.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/git_nautilus_icons"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/git_nautilus_icons/git_nautilus_icons"
	python2 setup.py build
}

package() {
	cd "$srcdir/git_nautilus_icons/git_nautilus_icons"
	python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 "$srcdir/git_nautilus_icons/LICENSE" -t \
		"$pkgdir/usr/share/licenses/${pkgname%-git}"
}

