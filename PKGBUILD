_pkgname=rainicorn
pkgname=$_pkgname-git
pkgver=r43.dcd2b68
arch=('x86' 'x86_64')
pkgrel=1
pkgdesc="Rainicorn is a tool intended for use by Rust IDEs."
url="https://github.com/RustDT/Rainicorn"
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+${url}.git")
sha1sums=('SKIP')
depends=('gcc-libs')
makedepends=('cargo')
license=('APACHE')

pkgver() {
        cd "$srcdir/$_pkgname"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" 
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
