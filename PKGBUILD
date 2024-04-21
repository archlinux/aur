# Maintainer: RiverOnVenus <error@zhui.dev>
pkgname=kernel-hardening-checker-git
pkgver=0.6.6.r40.g0b96b5b
pkgrel=1
pkgdesc='A tool for checking the security hardening options of the Linux kernel'
url="https://github.com/a13xp0p0v/kernel-hardening-checker"
arch=('any')
license=('GPL-3.0-only')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=('kernel-hardening-checker')
conflicts=('kernel-hardening-checker')
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
    install -Dm644 "$srcdir/$pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
 
