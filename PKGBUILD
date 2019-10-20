# Maintainer: Simon Tas <simon.tas.st@gmail.com>
# Co-Maintainer: telans <telans@protonmail.com>

pkgname="sam-rewritten-git"
_pkgname="SamRewritten"
pkgver=r39.50f2d7b
pkgrel=2
pkgdesc="A Steam Achievement Manager For Linux."
arch=("any")
url="https://github.com/PaulCombal/SamRewritten"
license=("GPL3")
depends=("steam" "yajl" "gtk3" "glibc")
makedepends=("git")
source=("git+https://github.com/PaulCombal/SamRewritten.git"
        "samrewritten.desktop")
md5sums=("SKIP"
         "0992c9065836983f5e8cf86a7340193d")

pkgver() {
    cd ${_pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${_pkgname}
    ./make.sh
}

package() {  
    install -dm755 "${pkgdir}/usr/lib/"
    # Only copy required files. (Except for Glade files, as more may be added in the future.)
    cp --parents ${_pkgname}/{LICENSE,README.MD,bin/{launch.sh,libsteam_api.so,samrewritten},glade/*.glade} "${pkgdir}/usr/lib/"
    # Executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "${pkgdir}/usr/lib/${_pkgname}/bin/launch.sh" "${pkgdir}/usr/bin/samrewritten"
    # Desktop Entry
    install -Dm644 "samrewritten.desktop" "${pkgdir}/usr/share/applications/samrewritten.desktop"
} 
