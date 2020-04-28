# Maintainer: Marc Mettke <marc@itmettke.de>
_pkgname=aurebuildcheck-rs
pkgname=$_pkgname-git
pkgver=0.2.1.r0.g2666ea9
pkgrel=1
pkgdesc="Archlinux package checker to identify packages which may need a rebuild"
arch=('x86_64')
url="https://github.com/mettke/aurebuildcheck-rs"
license=('MIT')
depends=('gcc-libs' 'pacman' 'which' 'file')
makedepends=('git' 'rust')
optdepends=(
	'glibc: perform checks via ldd'
	'binutils: perform checks via readelf'
	'pkgfile: find packages containing missing libraries'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  ./build_release.sh
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 LICENSE "$pkgdir/usr/share/licenses/aurebuildcheck-rs-git/LICENSE"
  install -Dm755 target/release/$_pkgname "$pkgdir/usr/bin/$_pkgname"
}
