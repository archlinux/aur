# Maintainer: Jason Nader <jason *add-dot-here* nader *you-know-what-goes-here* protonmail.com>

pkgname=python-broadlink-git
_pkgname=python-broadlink
pkgver=0.19.0.r0.g730853e
pkgrel=2
arch=('any')
license=("MIT")
pkgdesc="broadlink_cli script for interacting with broadlink remote control devices"
depends=('python' 'python-cryptography')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer')
url="https://github.com/mjg59/python-broadlink"
source=("${pkgname%-*}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl

  mkdir -p "$pkgdir/usr/bin/"
  cp ./cli/broadlink* "$pkgdir/usr/bin/"
}
