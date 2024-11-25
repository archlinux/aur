# Maintainer: William J. Bowman <aur@williamjbowman.com>
# Contributer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-defusedxml-git
pkgname=("python-defusedxml-git")
_pkgname="defusedxml"
pkgver=v0.8.0rc2.r1.gc744588
pkgrel=2
pkgdesc="XML bomb protection for Python stdlib modules"
arch=('any')
url='https://github.com/tiran/defusedxml'
license=('PSF-2.0')
depends=('python-lxml')
makedepends=('git' 'python' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
conflicts=('python-defusedxml')
provides=('python-defusedxml')
source=('git+https://github.com/tiran/defusedxml.git')
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  python -m build --wheel --no-isolation
}

check(){
    cd "$_pkgname"

    python -m tests
}

package() {
    cd "$_pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
