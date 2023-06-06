# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-pywwt
_name=${pkgname#python-}
pkgver=0.19.2
pkgrel=1
pkgdesc="Python interface to the Windows and Web client of WorldWide Telescope"
arch=(any)
url="https://github.com/WorldWideTelescope/pywwt"
license=('BSD')
groups=()
depends=(python-numpy python-matplotlib python-requests python-beautifulsoup4 python-lxml python-ipywidgets python-traitlets python-qtpy python-flask python-six)
makedepends=(python-build python-installer)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('6810fb91a3cb12da90552a689dd34d99ce9afd08e1b3bcd2dee0124c185f91f7')


build() {
    cd "$srcdir/$_name-$pkgver"
	sed -i 's/ensure_python/#ensure_python/' setup.py
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

