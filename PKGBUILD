# Maintainer: Zanny <lordzanny@gmail.com>

pkgname=verdigris-git
_name=verdigris
pkgver=r137.de24629
pkgrel=1
pkgdesc="Qt without moc: set of macros to use Qt without needing moc"
arch=('any')
url="https://github.com/woboq/verdigris"
license=('LGPL3')
depends=(qt5-base)
provides=(verdigris)
conflicts=(verdigris)
source=("git+https://github.com/woboq/$_name.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_name"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# verdigris is header-only - the qmake routine is just a test harness
check() {
    cd "$srcdir/$_name"
    qmake
    make
}

package() {
    for header in 'wobjectdefs.h' 'wobjectimpl.h'; do
        install -Dm644 "$srcdir/$_name/src/$header" "$pkgdir/usr/include/$header"
    done
}
