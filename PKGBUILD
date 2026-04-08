# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-camb  
_name=${pkgname#python-}
pkgver=1.6.6
pkgrel=1
pkgdesc="Code for Anisotropies in the Microwave Background"
arch=(any)
url="https://github.com/cmbant/CAMB"
license=('custom')
groups=()
makedepends=(python-build python-installer)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('9856202a5c05570256e52377b20431891c7b08b2e9c334e141fd08d2a085516f')
build() {
    cd "$srcdir/$_name-$pkgver"
    export MAKEFLAGS="-j1"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    install -D -m644 $srcdir/../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 
    python -m installer --destdir="$pkgdir" dist/*.whl
}

