pkgdesc='App Container Server Push Command'
pkgname=acpush
pkgver=0.0.0 # TODO pending release
pkgrel=5
url="https://github.com/appc/$pkgname"
source=("git+${url}.git")
makedepends=('git' 'go')
options=('!strip')
arch=('i686' 'x86_64')
md5sums=('SKIP')
license=('Apache')

# 1.
prepare() { # TODO pending release
    local base=$(cd "$(dirname "${BASH_SOURCE[0]}" )" && pwd)
    local repo="$srcdir/$pkgname" # working repo location
    local target=$([[ $pkgver == "0.0.0" ]] && printf "master" || printf "v$pkgver")
    git -C "$repo" checkout --quiet "$target" # checkout proper version
    git -C "$repo" status # verify working repo change
}

# 2.
build() {
    cd $pkgname
    ./build
}

# 3.
check() {
    true
}

# 4.
package() {
    cd "$pkgname"
    install -D -m755 bin/$pkgname "$pkgdir/usr/bin/$pkgname"
}
