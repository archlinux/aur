# Maintainer: Ben Davison <nimijneb.bd@gmail.com>
pkgname=imx471-dkms-git
_pkgbase=imx471
pkgver=r8.293a166
pkgrel=2
pkgdesc="IMX471 sensor driver via DKMS"
arch=('x86_64')
url="https://github.com/BenBJD/imx471-dkms"
license=('GPL2')
depends=('dkms')
makedepends=('git')
provides=('imx471')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgbase}-dkms"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${_pkgbase}-dkms"
  local install_dir="$pkgdir/usr/src/$_pkgbase-$pkgver"

  install -d "$install_dir"

  install -m644 imx471.c Makefile dkms.conf "$install_dir/"

  sed -i "s/^PACKAGE_VERSION=.*/PACKAGE_VERSION=\"$pkgver\"/" "$install_dir/dkms.conf"
  sed -i "s/^PACKAGE_NAME=.*/PACKAGE_NAME=\"$_pkgbase\"/" "$install_dir/dkms.conf"
}
