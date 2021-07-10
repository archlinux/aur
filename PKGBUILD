# Maintainer: Groctel <aur@taxorubio.com>
# Maintainer: Naveen M K <naveen521kk@gmail.com>

pkgbase=manimce
pkgname=manim
pkgver=0.8.0
pkgrel=2
pkgdesc="Animation engine for explanatory math videos (community edition)."

arch=('any')
license=('MIT' 'custom')
url="https://www.manim.community/"

source=("https://github.com/ManimCommunity/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('2857afc0c9acd04bf0c5088f939edef744b5aef5455d48f22036baebb64d8e82482376281e06bb24fc7980eca13946779a9d7e9dcaa145fda5650235a1d1c05e')

conflicts=('python-manimlib')

depends=(
	'ffmpeg'
	'python'
	'python-cairo'
	'python-click'
	'python-click-default-group'
	'python-colour'
	'python-decorator'
	'python-google-api-core'
	'python-importlib-metadata'
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
	'python-screeninfo'
)
makedepends=('python-setuptools')
optdepends=(
	'jupyterlab: Jupyter something'
	'python-grpcio-tools: WebGL renderer'
	'texlive-core: LaTeX support'
)

prepare ()
{
	cd "$srcdir/$pkgname-$pkgver"
	sed -i 's/cloup>=0.7.0,<0.8.0/cloup/g' setup.py
}

build ()
{
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py build
}

package ()
{
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -D -m644 LICENSE.community "$pkgdir/usr/share/licenses/$pkgname/LICENSE.community"
}
