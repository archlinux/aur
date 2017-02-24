# Maintainer: Chris Nixon <chris.nixon@sigma.me.uk>
_pkgname=rewrite
pkgname=$_pkgname
pkgver=0.1.r0.g745d248
pkgrel=1
pkgdesc="Utility that allows for the in-place rewrite of a file's contents"
arch=('x86' 'x86_64')
url="https://github.com/neosmart/rewrite"
makedepends=('git' 'cargo')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+${url}.git")
sha1sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    echo $(git describe --long --tags `git tag --sort=-v:refname` |\
           head -n1 | sed 's/\([^-]*-g\)/r\1/;s/-/./g')
}

build() {
    cd "$srcdir/$_pkgname"
    git checkout $(git tag --sort=-v:refname | head -n1)
    cargo build --release
}

check() {
    cd "$srcdir/$_pkgname"
    cargo test --release
}

package() {
    cd "$srcdir/$_pkgname"
    install -D "target/release/rewrite" "$pkgdir/usr/bin/rewrite"
}
