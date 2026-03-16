# Maintainer: asyync1024 <asyync1024 at proton dot me>

_reponame=bin-cpuflags-x86
pkgname=$_reponame-git
pkgver=1.0.8.r0.g4c2a7c5
pkgrel=2
pkgdesc='A small CLI tool to detect CPU flags (instruction sets) of X86 binaries (git)'
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/HanabishiRecca/$_reponame"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo' 'git')
provides=("$_reponame")
conflicts=("$_reponame")
source=("git+${url}.git")
b2sums=('SKIP')

pkgver() {
    cd "$_reponame"
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

prepare() {
    cd "$_reponame"
    cargo fetch --locked
}

build() {
    cd "$_reponame"
    cargo build --frozen --release --target-dir "$srcdir"
}

check() {
    cd "$_reponame"
    cargo test --frozen
}

package() {
    install -Dm755 "release/$_reponame" -t "$pkgdir/usr/bin"
    install -Dm644 "$_reponame/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
