# Maintainer: Johannes Larsen <mail@johslarsen.net>
pkgname=grdl-git-get-git
pkgver=v0.4.0.r0.f678f4f
pkgrel=1
pkgdesc="A better way to clone, organize and manage multiple git repositories"
arch=('x86_64')
url="https://github.com/grdl/git-get"
license=('MIT')
groups=()
depends=()
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}::git+${url}")
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    for cmd in ./cmd/*; do
        go build -o git-${cmd##*/} $cmd
    done
}

check() {
    cd "$srcdir/${pkgname%-git}"
    EMAIL=build-user@example.com GIT_CONFIG_NOSYSTEM=1 HOME=$PWD go test ./...
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -Dm755 git-get "${pkgdir}/usr/bin/git-get"
    install -Dm755 git-list "${pkgdir}/usr/bin/git-list"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
}
