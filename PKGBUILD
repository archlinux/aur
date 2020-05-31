# Maintainer: nycex <nycex / cccp.org>
_pkgbasename=axosnake
pkgname=$_pkgbasename-git
pkgrel=2
pkgver=r69.f4e09b3
pkgdesc="a snake game written in rust with quicksilver"
arch=('any')
url="https://codeberg.org/nycex/$_pkgbasename"
license=('MIT')
depends=('cargo')
source=(git+https://gitlab.com/nycex/${_pkgbasename})
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgbasename}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgbasename}"
    cargo build --release
}

package() {
    cd "${srcdir}/${_pkgbasename}"

    install -D -m755 target/release/$_pkgbasename "${pkgdir}/usr/bin/$_pkgbasename"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/$_pkgbasename/LICENSE"
}
