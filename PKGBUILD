#By DameChocolateYa

pkgname=sbell
pkgver=1.0
pkgrel=1
pkgdesc="A minimalist interpreter"
arch=('x86_64')
license=('GPL')
depends=('git')
source=("git+https://github.com/DameChocolateYa/sbell.git#branch=main")
md5sums=('SKIP')

build() {
    cd "${pkgname}"
    make
}

package() {
    cd "${pkgname}"
    install -Dm755 sbell "$pkgdir/usr/bin/sbell"

    install -d "$pkgdir/etc/sbell/lang"

    for lang_file in lang/*; do 
        if [ -f "$lang_file" ]; then
            install -Dm644 "$lang_file" "$pkgdir/etc/sbell/lang/$(basename "$lang_file")"
        fi 
    done
}
