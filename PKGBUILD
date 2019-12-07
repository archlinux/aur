# Maintainer: nycex <nycex@protonmail.com>
_pkgbasename=axosnake
pkgname=$_pkgbasename-git
pkgrel=1
pkgver=r67.6caf3a1
pkgdesc="a snake game written in rust with quicksilver"
arch=('any')
url="https://gitlab.com/nycex/$_pkgbasename"
license=('MIT')
depends=('rust')
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
    install -D -m644 LICENSE "${pkgdir}/usr/share/license/$_pkgbasename/LICENSE"
}
