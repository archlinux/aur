# Maintainer: Navon John Lukose <67406856+Magniquick@users.noreply.github.com>

pkgname=intel-gna-dkms-git
_modname=intel-gna
_subdir=gna
pkgver=r2.de3c9e0
pkgrel=1
pkgdesc="Intel GNA (Gaussian & Neural Accelerator) accel driver, DKMS (out-of-tree port of the v5 dri-devel series)"
arch=('any')
url="https://github.com/Magniquick/intel-client-dkms"
license=('GPL-2.0-only')
depends=('dkms')
makedepends=('git')
provides=('intel-gna-dkms')
conflicts=('intel-gna-dkms')
source=("intel-client-dkms::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd intel-client-dkms
  printf "r%s.%s" "$(git rev-list --count HEAD -- "$_subdir")" \
    "$(git log -1 --format=%h -- "$_subdir")"
}

package() {
  cd "intel-client-dkms/$_subdir"
  local dest="$pkgdir/usr/src/$_modname-$pkgver"

  install -d "$dest"
  cp -r --no-preserve=ownership . "$dest"
  sed -i "s/@PKGVER@/$pkgver/" "$dest/dkms.conf"

  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
  cp -r --no-preserve=ownership LICENSES "$pkgdir/usr/share/licenses/$pkgname/"
}
