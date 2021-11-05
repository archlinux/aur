# Maintainer: Groctel <aur@taxorubio.com>
# Maintainer: Naveen M K <naveen521kk@gmail.com>

pkgbase=manimce
pkgname=manim
pkgver=0.12.0
pkgrel=2
pkgdesc="Animation engine for explanatory math videos (community edition)."

arch=('any')
license=('MIT' 'custom')
url="https://github.com/ManimCommunity/manim"

source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('8276d560575de79b53338f0a8030ab577825a47529c6786054c7e36851f1d04c37cfe0b3a3ab3d3abf13ab0c2a78554ce82b8eb64f2d7760d89aa1c7fefe4343')

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
	'python-isosurfaces'
	'python-manimpango'
	'python-mapbox-earcut'
	'python-moderngl-git'
	'python-moderngl-window'
	'python-pydub'
	'python-screeninfo'
	'python-skia-pathops'
)
makedepends=(
	'python-setuptools'
)
optdepends=(
	'jupyterlab: Jupyter something'
	'python-grpcio-tools: WebGL renderer'
	'texlive-core: LaTeX support'
)

prepare ()
{
	cd "$srcdir/$pkgname-$pkgver"
	sed -i 's/cloup>=0.7.0,<0.8.0/cloup/g' setup.py
	sed -i 's/screeninfo>=0.6.7,<0.7.0/screeninfo/g' setup.py
	sed -i 's/mapbox-earcut>=0.12.10,<0.13.0/mapbox-earcut/g' setup.py
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
