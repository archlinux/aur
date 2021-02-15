# Maintainer: Tim Yang <protonmail = timdyang>

pkgname=tuxi-git
pkgver=r18.16d668e
pkgrel=1
pkgdesc="A CLI assistant which scrapes Google search to get instant answers to your questions on your terminal"
arch=(any)
url=https://github.com/Bugswriter/tuxi
license=(custom)
depends=(jq pup recode)
makedepends=(git)
provides=(tuxi)
conflicts=(tuxi)
source=($pkgname::git+https://github.com/Bugswriter/tuxi)
md5sums=(SKIP)

pkgver() {
    cd "$srcdir"/$pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir"/$pkgname
    sed '1,/^#* License/d' README.md > LICENSE
}

package() {
    cd "$srcdir"/$pkgname
    install -Dm755 tuxi "$pkgdir"/usr/bin/tuxi
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
