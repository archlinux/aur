# Maintainer: Emerold <emerald-foe-manor at duck dot com>
# Contributor: Muhammad <tjmnkrajyej at gmail dot com>

pkgname=odinls-git
_pkgname_no_git="${pkgname%-*}"
pkgver=dev_2025_11.r38.g465e4b4
pkgrel=1
pkgdesc='ols: Language server for Odin'
arch=('x86_64')
url='https://github.com/DanielGavin/ols'
license=('MIT')
depends=('odin')
makedepends=('git')
optdepends=('odinfmt: Odin source code formatter')
provides=("$_pkgname_no_git=$pkgver")
conflicts=("$_pkgname_no_git")
options=(!lto)
source=("$_pkgname_no_git::git+$url.git")
sha256sums=(SKIP)

pkgver() {
    cd "$_pkgname_no_git/"
    git describe --long --abbrev=7 | sed 's/-\([^-]*\)-g/.r\1.g/;s/-/_/g'
}

build() {
    cd "$_pkgname_no_git/"
    ./build.sh
}

package() {
    cd "$_pkgname_no_git/"
    install -Dm755 ols "$pkgdir/usr/lib/$_pkgname_no_git/ols"
    install -Dm644 -t "$pkgdir/usr/lib/$_pkgname_no_git/builtin/" builtin/*
    install -dm755 "$pkgdir/usr/bin/"
    # symlink in /usr/bin
    ln -s "/usr/lib/$_pkgname_no_git/ols" "$pkgdir/usr/bin/$_pkgname_no_git"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname_no_git/LICENSE"
}
