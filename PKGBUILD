# This package is licensed under the GNU Affero General Public License v3.0 (AGPLv3)
# See https://www.gnu.org/licenses/agpl-3.0.html for more details.

pkgname=sbell
pkgver=1.0
pkgrel=1
pkgdesc="A minimalist interpreter"
arch=('x86_64')
license=('GPL3')
depends=('git')
source=("git+https://github.com/DameChocolateYa/sbell.git#branch=main")
md5sums=('SKIP')

build() {
    cd "${pkgname}"
    make
}

package() {
    cd "${pkgname}"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm755 sbell "$pkgdir/usr/bin/sbell"

    install -d "$pkgdir/etc/sbell/lang"

    for lang_file in lang/*; do 
        if [ -f "$lang_file" ]; then
            install -Dm644 "$lang_file" "$pkgdir/etc/sbell/lang/$(basename "$lang_file")"
        fi 
    done
}
