# Maintainer: Groctel <aur@taxorubio.com>
pkgname=manim-community
_name=manim
pkgver=0.2.0
pkgrel=1
pkgdesc="Animation engine for explanatory math videos (community edition)."
arch=('any')
url="https://github.com/ManimCommunity/manim/"
license=('MIT' 'custom')
depends=(
	'python'
	'cairo'
	'ffmpeg'
	'python'
	'python-black'
	'python-cairo'
	'python-colour'
	'python-grpcio'
	'python-guzzle-sphinx-theme'
	'python-matplotlib'
	'python-networkx'
	'python-numpy'
	'python-pillow'
	'python-pygments'
	'python-pylint'
	'python-pytest'
	'python-recommonmark'
	'python-rich'
	'python-scipy'
	'python-tqdm'
	'python-watchdog'

	# Aur dependencies
	'python-grpcio-tools'
	'python-manimpango'
	'python-pydub'
)
makedepends=(
	'sed'
)
optdepends=(
	'texlive-most: latex support'
)
conflicts=('python-manimlib')
provides=()
source=("https://github.com/ManimCommunity/$_name/releases/download/v$pkgver/$_name-$pkgver.tar.gz")
sha256sums=('01925f8550b5dd96275259e1943a12216d18f851202aa88abde16d660148638f')

prepare() {
	cd "$srcdir/$_name-$pkgver"
	sed -i "/'progressbar',/d" setup.py
	sed -i 's/rich>=6.0,<7.0/rich/' setup.py
}

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$_name/LICENSE"
	install -D -m644 LICENSE.community "$pkgdir/usr/share/licenses/$_name/LICENSE.community"
}
