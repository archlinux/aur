# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=pacpush
pkgver=3.1
pkgrel=1
pkgdesc="Utility to push an Arch hosts package and AUR caches to other hosts"
url="https://github.com/bulletmark/$pkgname"
license=("GPL3")
arch=("any")
depends=("python>=3.10" "rsync" "sudo" "openssh" "python-platformdirs"
         "python-requests" "pyalpm")
makedepends=(python-setuptools python-build python-installer
             python-wheel python-setuptools-scm)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha1sums=('8863f454ab2714cf6f577463ee8f28f404d92b46')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
