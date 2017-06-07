# Maintainer: Dylan Simowitz <dsimowitz@gmail.com>
# Maintainer: Alex Yatskov <alex@foosoft.net>
pkgname=homemaker-git
_pkgname=homemaker
pkgver=r126.87f1a4e
pkgrel=2
pkgdesc="Homemaker is a lightweight tool for straightforward and efficient management of *nix configuration files found in the user's home directory, commonly known as dot-files."
arch=('any')
url="https://github.com/FooSoft/homemaker"
license=('MIT')
provides=($_pkgname)
conflicts=($_pkgname)
depends=(
    'go'
)
optdepends=(
)
makedepends=('git')
source=("$pkgname::git+https://github.com/FooSoft/homemaker.git")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"
    go get -d
    go build -o "$_pkgname"
    mkdir -p "${pkgdir}/usr/bin"
    install -D -m755 ./homemaker "${pkgdir}/usr/bin/$_pkgname"
}
