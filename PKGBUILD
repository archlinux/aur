# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Mykhailo Aleksieiev <nekohepott@larpdhq.org>
pkgname=gogofetch-git
pkgver=r23.5ea5393
pkgrel=1
pkgdesc="fetch made with C++ rewritten to go for no reason"
arch=('x86_64')
url="git+https://codeberg.org/nekohepott/goGoFetch.git"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
checkdepends=()
optdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://codeberg.org/nekohepott/goGoFetch.git")
sha256sums=('SKIP')

pkgver() {
  cd "goGoFetch"
  # Считает общее количество коммитов и добавляет хеш последнего
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "goGoFetch"
    git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
	cd "goGoFetch"
	go build -o "$pkgname" .
}

package() {
    cd "goGoFetch"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
