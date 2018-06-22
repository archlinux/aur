# Maintainer: Craig Barnes (cbb)

_gitname=ctags
pkgname=uctags-git
pkgver=0.r6004+6aa62c97
pkgrel=1
pkgdesc='Universal ctags (patched to allow installing alongside original ctags)'
arch=('x86_64')
url='https://ctags.io/'
license=('GPL')
depends=('libxml2' 'jansson' 'libyaml' 'bash')
makedepends=('git' 'python-docutils')
source=("git+https://github.com/universal-ctags/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    printf "0.r%s+%s" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_gitname"
    ./autogen.sh
    ./configure --prefix=/usr --libexecdir=/usr/lib --sysconfdir=/etc
    make
}

package() {
    cd "$srcdir/$_gitname"
    install -Dm755 ctags "$pkgdir/usr/bin/uctags"
    install -Dm755 readtags "$pkgdir/usr/bin/ureadtags"
    MANPREFIX="$pkgdir/usr/share/man"
    install -Dm644 man/ctags.1 "$MANPREFIX/man1/uctags.1"
    install -Dm644 man/ctags-optlib.7 "$MANPREFIX/man7/uctags-optlib.7"
}
