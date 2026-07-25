# Maintainer: asyync1024 <asyync1024 at proton dot me>

_reponame=ndstrim-rs
pkgname=$_reponame-git
pkgver=0.2.1.r14.g9001c15
pkgrel=1
pkgdesc="A cross-platform NDS(i) ROM trimmer written in Rust (git-version)"
arch=('x86_64')
url="https://github.com/Nemris/ndstrim-rs"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo' 'git')
provides=('ndstrim')
conflicts=('ndstrim')
source=("$_reponame::git+$url.git")
b2sums=('SKIP')

pkgver() {
    cd "$_reponame"
    git describe --long --tags | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "$_reponame"
    cargo build --release # --locked is omitted since the build fails with it.
}

package() {
    cd "$_reponame"
    install -Dm755 "target/release/ndstrim" -t "$pkgdir/usr/bin"
    install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
