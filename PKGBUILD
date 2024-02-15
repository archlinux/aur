# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='kahlo'
pkgver='1.5.2'
pkgrel='1'
pkgdesc='Video download tool that automatically downloads newly posted videos from channels on supported websites'
arch=('any')
url="https://gitlab.com/dpeukert/$pkgname"
license=('GPL-3.0-or-later')
depends=('python>=3.8.0' 'python-argcomplete' 'yt-dlp')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('dc1f21ca17320a88e6ebd3697728ca2d1070441e20912b43380c495b843be80fdfcca555a79fb87554af7145c975c875f79378b9d549d9584e39c2f7486a21ab')

_sourcedirectory="$pkgname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python -m installer --destdir="$pkgdir" 'dist/'*'.whl'

	install -dm755 "$pkgdir/usr/share/bash-completion/completions/"
	echo 'eval "$(register-python-argcomplete --shell bash kahlo)"' > "$pkgdir/usr/share/bash-completion/completions/$pkgname"

	install -dm755 "$pkgdir/usr/share/fish/vendor_completions.d/"
	echo 'eval "$(register-python-argcomplete --shell fish kahlo)"' > "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
}
