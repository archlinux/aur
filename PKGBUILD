# Maintainer: Groctel <aur@taxorubio.com>
pkgbase=manimce
pkgname=manim-community
_name=manim
pkgver=0.5.0
pkgrel=1
pkgdesc="Animation engine for explanatory math videos (community edition)."
arch=('any')
url="https://www.manim.community/"
license=('MIT' 'custom')
depends=(
	'ffmpeg'
	'python'
	'python-cairo'
	'python-click'
	'python-click-default-group'
	'python-colour'
	'python-decorator'
	'python-networkx'
	'python-numpy'
	'python-pillow'
	'python-pygments'
	'python-rich'
	'python-scipy'
	'python-setuptools'
	'python-tqdm'
	# Aur dependencies
	'python-cloup'
	'python-manimpango'
	'python-mapbox-earcut'
	'python-moderngl-git'
	'python-glcontext'
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
sha512sums=('d736156a7e359f65575d96ab389fda7d4a65ba19d9a28ddf827a9b2f2566e67fd52053de70f41357120b71225a266ef1352a39876b60fd897e10a155c0110469')

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

