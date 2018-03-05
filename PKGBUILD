# Maintainer: Ammon Smith <ammon.i.smith@gmail.com>

pkgname="iget-git"
pkgver=1.1.1.65fd71e
pkgrel=1
pkgdesc='A command-line program to give you the number of days until or since certain events.'
arch=('any')
url="https://gitlab.com/ammongit/${pkgname%-git}"
license=('MIT')
depends=('python' 'python-setuptools')
makedepends=('git')
optdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=()
source=("git+https://gitlab.com/ammongit/${pkgname%-git}.git"
        'iget-wrapper.sh')
sha256sums=('SKIP'
            '184c33840db24b394e76d143534a9f80b8a355c31f0635287286e0791704c1ee')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	local _ver="$(git describe --tags | sed 's/-/_/g')"
	printf '%s.%s' "${_ver:1}" "$(git describe --always)"
}

package() {
	cd "$srcdir"
	install -D -m755 'iget-wrapper.sh' "$pkgdir/usr/bin/iget"

	cd "$srcdir/${pkgname%-git}"
	python setup.py install --root="$pkgdir/" --optimize=1
	install -D -m644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set ft=sh noet:
