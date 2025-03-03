# Maintainer: Sudrien <_+aur@sudrien.net>
pkgname=eliteapi-git
_pkgname=EliteAPI
pkgver=3.3.10.0.g8042c8f
pkgrel=1
pkgdesc="Provides API for Elite Dangerous"
arch=("x86_64")
url="https://github.com/Somfic/EliteAPI"
license=('MIT')
depends=(
  dotnet-runtime
)
makedepends=(
  git
  dotnet-sdk
)
provides=("${pkgname%-*}=$pkgver")
conflicts=("eliteapi")
source=('git+https://github.com/Somfic/EliteAPI.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags --abbrev=7 | sed -e 's/^Release\///' -e 's/-/./g' -e 's/\([^-]*-g\)/r\1/'
}

build() {
  cd "$srcdir/$_pkgname"
	dotnet build -o out -c Release
}


package() {
  mkdir -p "$pkgdir/opt"
  mv "$srcdir/EliteAPI/out" "${pkgdir}/opt/$pkgname"
}
