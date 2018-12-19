# Maintainer: Aiyion <aur@aiyionpri.me>
_pkgname=heimdallr
pkgname=$_pkgname-git
pkgver=v1.0.2.r0.ga835dd6
pkgrel=1
pkgdesc="finding public ssh keys with ease"
arch=('x86_64')
url="https://github.com/AiyionPrime/heimdallr"
license=('MIT')
groups=()
depends=('curl' 'json-c' 'libssh')
makedepends=('git')
checkdepends=()
optdepends=()
provides=('heimdallr-git')
conflicts=('heimdallr')
replaces=()
backup=()
options=()
install=
changelog=
source=(git+https://github.com/aiyionprime/heimdallr.git)
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
        cd "$_pkgname"
        make
}

package() {
        cd "$_pkgname"
        make DESTDIR="$pkgdir/" install-bin
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	make doc
	install -Dm644 heimdallr.1.gz "$pkgdir/usr/share/man/man1/heimdallr.1.gz"

}

