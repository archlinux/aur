# Maintainer: Groctel <aur@taxorubio.com>
# Maintainer: Naveen M K <naveen521kk@gmail.com>

_name=manim
pkgbase=manimce
pkgname=manim
pkgver=0.17.3
pkgrel=1
pkgdesc="Animation engine for explanatory math videos (community edition)."

arch=('any')
license=('MIT' 'custom')
url="https://github.com/ManimCommunity/manim"

source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('188fa537a2ee49b6d576ae191e0931dc71002a9ae1cfc8380ca51c03192ebc00e2c529dce1a2d210aa68d776274bace8aaa8691acfae78466970e553848e7f30')

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
	# 'python-watchdog' uses AUR git version while community is OOD
	'python-networkx'
	# Aur dependencies
	'python-cloup'
	'python-backports.cached_property'
	'python-glcontext'
	'python-isosurfaces'
	'python-manimpango'
	'python-mapbox-earcut'
	'python-moderngl'
	'python-moderngl-window'
	'python-pydub'
	'python-screeninfo'
	'python-skia-pathops'
	'python-srt'
	'python-svgelements'
	'python-watchdog-git'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-wheel'
	'python-poetry-core'
)
optdepends=(
	'jupyterlab: Jupyter something'
	'python-grpcio-tools: WebGL renderer'
	'texlive-core: LaTeX support'
)

prepare ()
{
	cd "$srcdir/$pkgname-$pkgver"
	sed -i 's/cloup = "^0.13.0"/cloup = "*"/g' pyproject.toml
}

build ()
{
	cd "$srcdir/$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package ()
{
	cd "$srcdir/$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -D -m644 LICENSE.community "$pkgdir/usr/share/licenses/$pkgname/LICENSE.community"
}
