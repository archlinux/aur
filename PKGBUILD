# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=flatpak-builder-lint-git
_reponame="${pkgname%-git}"
pkgver=r147.3c8daa9
pkgrel=1
pkgdesc='A linter for flatpak-builder manifests'
arch=(any)
url="https://github.com/flathub/$_reponame"
license=(MIT)
depends=(python python-requests python-jsonschema flatpak-builder)
makedepends=(git python-build python-installer python-wheel python-poetry)
provides=("$_reponame")
conflicts=("$_reponame")
source=("git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_reponame"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_reponame"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_reponame"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
