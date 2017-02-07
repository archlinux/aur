# Maintainer: William Gathoye <william at gathoye dot be>
# Contributor: rws <elisp dot vim at google mail>

_pkgname=clog
pkgname=${_pkgname}-git
pkgver=198
pkgrel=1

pkgdesc='Generate beautiful changelogs from your Git commit history'
arch=('i686' 'x86_64')
url='https://github.com/clog-tool/clog-cli'
license=('MIT')

makedepends=('git' 'rust' 'cargo')
provides=('clog')
conflicts=('clog-bin')

source=("git://github.com/thoughtram/${_pkgname}.git")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git rev-list --count HEAD
}

build() {
    cd "$srcdir/$_pkgname"
    cargo build --release
}

package() {
    cd "$srcdir/$_pkgname"
    mkdir -p "${pkgdir}/usr/bin"
    cp -p target/release/clog "${pkgdir}/usr/bin"
}
