# Maintainer: Agil Mammadov <mammadovagil@proton.me>
# Contributor: Emilio Reggi <nag@mailbox.org>
# Contributor: Morten Linderud <morten@linderud.pw>
# Contributor: Alad Wenter <https://wiki.archlinux.org/index.php/Special:EmailUser/Alad>

pkgname=dmenu-extended-git
_pkgname=dmenu-extended
_source=https://github.com/markjones112358/dmenu-extended.git
pkgver=1.5.0.r1.dd93e7a
pkgrel=1
pkgdesc='An extension to dmenu for quickly opening files and folders and run programs.'
url='https://github.com/markjones112358/dmenu-extended'
license=('MIT')
arch=('any')
depends=(python dmenu)
makedepends=(git python-installer python-build python-wheel)
provides=(dmenu-extended)
conflicts=(dmenu-extended)
source=("${_pkgname}"::"git+${_source}")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$_pkgname"
	python3 -m build --wheel --no-isolation
}

package() {
	cd "$_pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
