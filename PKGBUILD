# Maintainer: Reza Jelveh <reza.jelveh+git@gmail.com>
#
# 0.2.0 substituted by the release workflow; the git source pins the
# tagged commit (sha256sums=SKIP is AUR-legal for VCS sources).
pkgname=notmutt
pkgver=0.2.0
pkgrel=1
pkgdesc='Async terminal email client built on notmuch (cgo backend)'
arch=('x86_64')
url='https://github.com/fishman/notmutt'
# The cgo backend links libnotmuch statically: this package is GPL-3.0,
# NOT Apache-2.0. The Apache-clean CLI variant ships as notmutt-cli.
license=('GPL-3.0-only')
depends=('notmuch')
makedepends=('go')
source=("notmutt::git+https://github.com/fishman/notmutt.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "$srcdir/notmutt/src"
    go build -tags lua -o ../notmutt .
}

package() {
    cd "$srcdir/notmutt"
    install -Dm755 notmutt "$pkgdir/usr/bin/notmutt"
    install -Dm644 README.md "$pkgdir/usr/share/doc/notmutt/README.md"
}
