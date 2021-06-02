# Maintainer: Groctel <aur@taxorubio.com>
# Maintainer: Naveen M K <naveen@syrusdark.website>

pkgbase=manimce
pkgname=manim
pkgver=0.7.0
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
	'python-numpy'
	'python-pillow'
	'python-pygments'
	'python-requests'
	'python-rich'
	'python-scipy'
	'python-setuptools'
	'python-tqdm'
	'python-watchdog'
	'python-networkx'
	# Aur dependencies
	'python-cloup'
	'python-glcontext'
	'python-manimpango'
	'python-mapbox-earcut'
	'python-moderngl-git'
	'python-moderngl-window'
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
source=("https://github.com/ManimCommunity/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('2c9c939c8771b3f48583295d63e230f7db89f8a4f6b5d97d3afec8eb295df7e9b5035be6b2e0c1bf0db9f9a14257f0ad86d48c25ab3d24e6600437f708c4641f')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	sed -i 's/rich>=6.0,<7.0/rich/' setup.py
	sed -i 's/decorator<5.0.0/decorator/' setup.py
	sed -i 's/click>=7.1,<8.0/click/' setup.py
	sed -i 's/cloup>=0.7.0,<0.8.0/cloup>=0.8.0/' setup.py
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

