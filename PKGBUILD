# Maintainer: Charlie Laabs <git@a.charlielaabs.com>

pkgname=romans-noise-gate-git
pkgdesc="Lookahead LADSPA noise gate plugin"
pkgver=0.1.b9fcacb
pkgrel=1
arch=('x86_64')
url="https://ro-che.info/articles/2019-01-12-better-noise-gate"
license=('GPL-3.0-only')
depends=('ladspa')
makedepends=('git' 'boost')
provides=("romans-noise-gate=${pkgver}")
conflicts=("romans-noise-gate")
source=("${pkgname}::git+https://github.com/UnkindPartition/noise-gate.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  # Strips the 'v' and joins the tag and short commit hash
  echo "$(git describe --tags --abbrev=0 | sed 's/^v//').$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  install -Dm755 ng.so "$pkgdir"/usr/lib/ladspa/ng.so
}
