# Maintainer: gigas002 <gigas002@pm.me>

pkgname=sweet-folders-git
_pkgname=Sweet-folders
pkgver=r29.40a5d36
pkgrel=1
arch=('any')
pkgdesc="Folder icons from the Sweet GTK Theme for Linux desktop environments"
url="https://github.com/EliverLara/${_pkgname}"
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=(
    "${pkgname%-git}"
    'sweet-folders-icons-git'
)
license=('GPL-3.0-only')
options=('!strip')
source=(
    "${_pkgname}::git+${url}"
    "21.patch"
)
b2sums=('SKIP'
        'b86edf2d974c4b4c62f4955628180bb2b4f7d211800410d3be16c1c011da0150871e5c13affd2f0fb90ec0205855c486486147cd50f55f3113b1fbd227112625')

prepare() {
    cd "${srcdir}/${_pkgname}"
    patch -p1 -N -i "${srcdir}/21.patch" || true
}

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -dm755 "${pkgdir}/usr/share/icons"
    cd "${srcdir}/${_pkgname}"
    cp -r [^.]* "${pkgdir}/usr/share/icons/"
    find "${pkgdir}/usr" -type f -exec chmod 644 {} +
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +
}
