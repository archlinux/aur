# Maintainer: RiverOnVenus <error@zhui.dev>
pkgname=pispy-git
pkgver=0.7.0.r0.g33f063e
pkgrel=1
pkgdesc='A terminal-based tool for looking up stuff in PyPI'
url="https://github.com/davep/pispy"
arch=('any')
license=('GPL-3.0-only')
depends=('python' 'python-httpx' 'python-textual' 'python-typing_extensions' 'python-packaging' 'python-linkify-it-py')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=('pispy')
conflicts=('pispy')
source=("$pkgname"::"git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare(){
  cd $pkgname
  git clean -dfx
}

build() {
    cd $pkgname
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
