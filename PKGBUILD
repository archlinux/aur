_pkgname=unity-version-manager
pkgname=${_pkgname}-git
pkgver=2.6.0
pkgrel=1
pkgdesc='cli utility to install and manager unity versions'
arch=(x86_64)
url='https://github.com/Larusso/unity-version-manager'
license=('Apache')
depends=(p7zip)
makedepends=(cargo git)
provides=('unity-version-manager')
conflicts=('unity-version-manager')
source=("git+https://github.com/Larusso/unity-version-manager.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
  cd $_pkgname
  cargo build --release --all
}

package() {
  cd $_pkgname
  make PREFIX="$pkgdir"/usr install
}
