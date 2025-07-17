# Maintainer: Andrew Shark <ashark at linuxcomp dot ru>

pkgname=python-imagebackup
_name=${pkgname#python-}
pkgver=0.2.1
pkgrel=1
pkgdesc="vntfsclone, vpartclone & vpartimage - Mount Image Backups as Virtual Partitions"
arch=("x86_64")
url="https://github.com/joergmlpts/imagebackup"
license=("MIT")
depends=("python-lz4" "python-tqdm" "python-pyfuse3" "python-zstandard")
makedepends=("python-build" "python-installer" "python-wheel")

source=("$_name-$pkgver.tar.gz"::"https://github.com/joergmlpts/imagebackup/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("9d10e6487278b00b495da9cbd422534cb2875f167c6bee0dbec3cff2150aa5fe")

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
