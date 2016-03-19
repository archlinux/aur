_pkgname=rainicorn
pkgname=$_pkgname
pkgver=1.0.0
arch=('x86' 'x86_64')
pkgrel=1
pkgdesc="Rainicorn is a tool intended for use by Rust IDEs."
url="https://github.com/RustDT/Rainicorn"
provides=("$_pkgname")
conflicts=("$_pkgname-git")
source=("$_pkgname::git+${url}.git")
sha1sums=('SKIP')
depends=('gcc-libs')
makedepends=('cargo')
license=('APACHE')

prepare() {
        cd "$srcdir/$_pkgname"
        git checkout version_1.x
}

build() {
        cd "$srcdir/$_pkgname"
        cargo build --release
}

#check() {
#        cd "$srcdir/$_pkgname"
#        cargo test --release  
#}

package() {
        cd "$srcdir/$_pkgname"
        cargo install --root "$pkgdir/"
        mkdir -p "$pkgdir/usr"
        mv "$pkgdir/bin" "$pkgdir/usr/bin"
}
