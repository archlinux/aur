# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-pywwt
_name=${pkgname#python-}
pkgver=0.9.0
pkgrel=4
pkgdesc="Python interface to the Windows and Web client of WorldWide Telescope"
arch=(any)
url="https://github.com/WorldWideTelescope/pywwt"
license=('BSD')
groups=()
depends=('python-numpy' 'python-matplotlib' 'python-requests' 'python-beautifulsoup4' 'python-lxml' 'python-ipywidgets' 'python-traitlets' 'python-qtpy' 'python-flask' 'python-six')
makedepends=('python-setuptools' 'npm')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=(a918b612f2164ff7c2167adba9a465659f047a4eb0772ae19bd8905531795925)
build() {
    cd "$srcdir/$_name-$pkgver"
	sed -i 's/ensure_python/#ensure_python/' setup.py
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

