# Maintainer: telans <telans@protonmail.com>
# Co-Maintainer: Simon Tas <simon.tas.st@gmail.com>

pkgname="samrewritten-git"
_pkgname="SamRewritten"
pkgver=r64.de951ed
pkgrel=1
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
            "f3c7c7217565e66fa2b55f56cda1e714c686c6359b1d39e15325405a82274f83")

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
    cp -r --parents ${_pkgname}/{LICENSE,README.MD,bin/{launch.sh,libsteam_api.so,samrewritten},glade/*.glade,assets} "${pkgdir}/usr/lib/"
    # Executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/usr/lib/${_pkgname}/bin/launch.sh" "${pkgdir}/usr/bin/samrewritten"
    # Desktop Entry
    install -Dm644 "samrewritten.desktop" "${pkgdir}/usr/share/applications/samrewritten.desktop"
} 
