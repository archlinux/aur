# Maintainer: Jonas 'cherti' Große Sundrup <aur@letopolis.de>

pkgname=blinky
pkgver=0.23.2
pkgrel=1
pkgdesc="AUR-helper with minimal hassle"
arch=(any)
url="https://github.com/cherti/blinky"
license=('GPLv3')
makedepends=(python-build python-installer python-wheel)
depends=('python' 'pyalpm' 'python-requests' 'python-termcolor' 'python-pyxdg' 'python-packaging' 'colordiff' 'wget')
optdepends=('libnotify')
options=(!emptydirs)
source=('https://github.com/cherti/blinky/archive/v0.23.2.tar.gz')
sha256sums=('579f3a4e728c2ba51ea79e14adfe7e09887d48f79ab099a07cc1029f31083f03')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dm644 completion/_blinky "$pkgdir/usr/share/zsh/site-functions/_blinky"
}
