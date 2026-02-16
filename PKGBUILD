# Maintainer: Ben Davison <nimijneb.bd@gmail.com>
pkgname=imx471-dkms-git
_pkgname=imx471-dkms
pkgver=r5.a928f90
pkgrel=1
pkgdesc="IMX471 sensor driver via DKMS"
arch=('x86_64')
url="https://github.com/BenBJD/imx471-dkms"
license=('GPL')
depends=('dkms')
makedepends=('git' 'linux-headers')
provides=("$_pkgname-dkms")
conflicts=("$_pkgname-dkms")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"
  local install_dir="$pkgdir/usr/src/$_pkgname-$pkgver"

  install -d "$install_dir"

  install -m644 imx471.c Makefile dkms.conf "$install_dir/"

  sed -i "s/^PACKAGE_VERSION=.*/PACKAGE_VERSION=\"$pkgver\"/" "$install_dir/dkms.conf"
  sed -i "s/^PACKAGE_NAME=.*/PACKAGE_NAME=\"$_pkgname\"/" "$install_dir/dkms.conf"
}
