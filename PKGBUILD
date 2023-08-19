# Maintainer:
# Contributor: asukaminato <asukaminato at nyan dot eu dot org>

pkgname=sassafras-git
pkgver=r261.32048ed
pkgrel=1
pkgdesc="Data analysis tool"
arch=('any')
url="https://github.com/georgeweigt/sassafras"
license=('BSD')
makedepends=('git' 'texlive-latex')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver(){
    cd "${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "${pkgname%-git}"
    make clean
    make
    make -C doc
}

check() {
    cd "${pkgname%-git}"
    make test
}

package() {
    cd "${pkgname%-git}"
    install -Dm755 sassafras -t "${pkgdir}/usr/bin/"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname/"
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname%-git}/" doc/*.{pdf,tex,html}
}
