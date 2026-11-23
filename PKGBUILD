# Maintainer: gigas002 <gigas002@pm.me>

pkgname=sweet-folders-git
_pkgname=Sweet-folders
pkgver=r37.23a572f
pkgrel=1
arch=('any')
pkgdesc="Folder icons from the Sweet GTK Theme for Linux desktop environments"
url="https://github.com/Gigas002/${_pkgname}"
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=(
    "${pkgname%-git}"
    'sweet-folders-icons-git'
)
license=('GPL-3.0-only')
options=('!strip')
source=("${_pkgname}::git+${url}.git")
b2sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -dm755 "${pkgdir}/usr/share/icons"
    cp -r Sweet-* "${pkgdir}/usr/share/icons/"
    find "${pkgdir}/usr/share/icons" -type f -exec chmod 644 {} +
    find "${pkgdir}/usr/share/icons" -type d -exec chmod 755 {} +
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
