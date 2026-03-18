# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=swaync-history-git
_reponame=swaync-history
pkgver=r5.e7b3e2d
pkgrel=1
pkgdesc='Notification history logger and replayer for swaync'
arch=(any)
url="https://github.com/adrianlzt/swaync-history"
license=(MIT)
depends=('python>=3.12' python-notify2 python-dbus python-gobject swaync)
makedepends=(git python-build python-installer python-wheel python-hatchling)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_reponame"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_reponame"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$_reponame"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
