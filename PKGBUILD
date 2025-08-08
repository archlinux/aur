# Maintainer: initMayday <initMayday@protonmail.com>
# Git dev branch package

_pkgname="dinit-user-spawn"
pkgname="$_pkgname-dev-git"
pkgrel=1
pkgver=r24.a97bb3b
pkgdesc='Launches a user process dinit for you on login'
arch=('any')
url='https://github.com/initMayday/dinit-user-spawn.git'
makedepends=('meson' 'git')
depends=('tomlplusplus')
provides=("$_pkgname")
conflicts=("$_pkgname")
license=('AGPL-3.0-or-later')
source=("$_pkgname::git+$url#branch=dev")
sha256sums=('SKIP')
builddir='build-release'
install='dinit-user-spawn.install'

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    meson setup "$builddir" --prefix=/usr
    meson compile -C "$builddir"
}

package() {
    cd "$_pkgname"
    meson install -C "$builddir" --destdir="$pkgdir"
    install -Dm644 "dinit-user-spawn.service" "$pkgdir/usr/lib/dinit.d/dinit-user-spawn" 
}
