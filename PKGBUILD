# Maintainer: Shulhan <ms@kilabit.info>

pkgname=git-review-git
pkgver=2.3.1.r1.7009d7d0
pkgrel=1
pkgdesc='Tool to submit code to Gerrit'
arch=('any')
url='https://opendev.org/opendev/git-review'
license=('APACHE')
depends=('git' 'python-requests')
makedepends=('python-pbr')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://opendev.org/opendev/git-review.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py install --optimize=1 --root="$pkgdir"
	install -Dm644 git-review.1 "$pkgdir"/usr/share/man/man1/git-review.1
}
