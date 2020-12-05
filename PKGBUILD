# Maintainer: Groctel <aur@taxorubio.com>
pkgname=manimce
pkgver=0.1.1
pkgrel=2
pkgdesc="Animation engine for explanatory math videos (community edition)."
arch=('any')
url="https://github.com/ManimCommunity/manim/"
license=('MIT' 'custom')
depends=(
	'cairo'
	'ffmpeg'
	'python'
	'python-cairo'
	'python-cairocffi'
	'python-colour'
	'python-numpy'
	'python-pillow'
	# 'python-progressbar' Doesn't work, must be installed with pip
	'python-pygments'
	'python-rich'
	'python-scipy'
	'python-tqdm'
	'python-watchdog'
)
makedepends=(
	'python-pip'
	'python-wheel'
)
optdepends=(
	'texlive-most: latex support'
)
provides=()
conflicts=('python-manimlib')
source=("https://github.com/ManimCommunity/manim/releases/download/v$pkgver/manimce-$pkgver.tar.gz")
sha256sums=('9660f1bf2a9696e6b4c5313ffb4b223f66468df5ab554bc605ff42ce1076b9b2')

prepare() {
	pip install pip --upgrade
	pip install --no-cache --force \
		grpcio \
		grpcio-tools \
		pangocffi==0.8.0 \
		pangocairocffi \
		progressbar \
		pydub \
		rich==6.0
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -D -m644 LICENSE.community "$pkgdir/usr/share/licenses/$pkgname/LICENSE.community"
}
