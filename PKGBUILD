# Maintainer: Cyril <cyrwae[at]hotmail[dot]com>
pkgname=python-fcl-git
pkgver=0.6.1
pkgrel=1
pkgdesc="Python bindings for the Flexible Collision Library"
arch=('x86_64')
url="https://github.com/BerkeleyAutomation/python-fcl"
license=('GPL')
groups=()
depends=('fcl')
makedepends=('python-setuptools')
optdepends=()
provides=('python-fcl')
conflicts=('python-fcl')
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}::git+https://github.com/CyrilWaechter/python-fcl")
noextract=()
md5sums=('SKIP')

build() {
	cd $pkgname
    python setup.py build
}

check(){
  cd $pkgname
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-${python_version}" pytest
}

package() {
	cd $pkgname
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" 'README.md'
}
