# Maintainer: telans <telans@protonmail.com>
# Co-Maintainer: Simon Tas <simon.tas.st@gmail.com>

pkgname="samrewritten-git"
_pkgname="SamRewritten"
pkgver=r119.7ff28cf
pkgrel=2
pkgdesc="A Steam Achievement Manager For Linux."
arch=("any")
url="https://github.com/PaulCombal/SamRewritten"
license=("GPL3")
depends=("steam" "yajl" "gtk3" "glibc")
makedepends=("git")
conflicts=("sam-rewritten-git")
source=("git+https://github.com/PaulCombal/SamRewritten.git"
        "samrewritten.desktop")
sha256sums=("SKIP"
            "0a2cb9f113839dab134738500d14987ba825449701f1782ef4d269c325f2f9e1")

pkgver() {
    cd ${_pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${_pkgname}
    make clean
    make
}

package() {  
    install -dm755 "${pkgdir}/usr/lib/"
    # Copy required files.
    cp -r --parents ${_pkgname}/{LICENSE,README.MD,bin/{launch.sh,libsteam_api.so,samrewritten},glade,assets/icon_256.png} "${pkgdir}/usr/lib/"
    install -Dm644 "${_pkgname}/assets/icon_256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/samrewritten.png"
    install -Dm644 "${_pkgname}/assets/icon_64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/samrewritten.png"
    # Executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/usr/lib/${_pkgname}/bin/launch.sh" "${pkgdir}/usr/bin/samrewritten"
    # Desktop Entry
    install -Dm644 "samrewritten.desktop" "${pkgdir}/usr/share/applications/samrewritten.desktop"
} 
