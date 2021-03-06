# Maintainer: Groctel <aur@taxorubio.com>
pkgbase=manimce
pkgname=manim-community
_name=manim
pkgver=0.4.0
pkgrel=1
pkgdesc="Animation engine for explanatory math videos (community edition)."
arch=('any')
url="https://www.manim.community/"
license=('MIT' 'custom')
depends=(
	'python'
	'ffmpeg'
	'python-cairo'
	'python-colour'
	'python-networkx'
	'python-numpy'
	'python-pillow'
	'python-pygments'
	'python-rich'
	'python-scipy'
	'python-tqdm'
	# Aur dependencies
	'python-manimpango'
	'python-pydub'
)
makedepends=(
	'python-setuptools'
)
optdepends=(
	'texlive-most: latex support'
)
conflicts=('python-manimlib')
provides=()
source=("https://github.com/ManimCommunity/$_name/releases/download/v$pkgver/$_name-$pkgver.tar.gz")
sha512sums=('302ca49b71e7e432fcdb97ba94de3ff59dd39f60a8fe0b883f45e54e674ebbcf6d10ef025ca7aebedfe5fa2d793ef6966e9d2bd9ea56c0bb226171a485a5e263')

prepare() {
	cd "$srcdir/$_name-$pkgver"
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

