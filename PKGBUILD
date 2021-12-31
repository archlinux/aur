# Maintainer: J. King <jking@jkingweb.ca>
pkgname="pam_sqlite-git"
pkgver=1.0.1.7
pkgrel=1
epoch=
pkgdesc="PAM module to provide authentication against SQLite tables"
arch=("x86_64" "i686" "aarch64")
url="https://github.com/HormyAJP/pam_sqlite3"
license=("GPL3")
depends=("pam" "sqlite")
makedepends=("git")
checkdepends=()
optdepends=()
backup=()
source=("$pkgname::git+https://github.com/HormyAJP/pam_sqlite3")
md5sums=("SKIP")

pkgver() {
    cd "$pkgname"
    git describe --tags | sed 's/v\([^-]\+\)-\([^-]\+\).*/\1.\2/'
}

build() {
    cd "$srcdir/$pkgname"
    ./configure
    make
}

package() {
    cd "$srcdir/$pkgname"
    install -d "$pkgdir/usr/lib/security" "$pkgdir/usr/share/doc/pam_sqlite"
    install -t "$pkgdir/usr/share/doc/pam_sqlite" CHANGELOG CREDITS LICENSE NEWS README pam_sqlite3.conf.example
    make ROOTDIR="$pkgdir/usr" install
}
