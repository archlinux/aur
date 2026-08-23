# Maintainer: Egor3f <ef@efprojects.com>
pkgname=konsole-companion-git
_pkgname=konsole-companion
pkgver=0.2.0.r5.gb3d4635
pkgrel=1
pkgdesc="Tab-set manager for KDE Konsole"
arch=('any')
url="https://github.com/Egor3f/konsole-companion"
license=('WTFPL')
depends=('python' 'pyside6' 'konsole')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "0.2.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 data/konsole-companion.desktop \
		"$pkgdir/usr/share/applications/konsole-companion.desktop"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
