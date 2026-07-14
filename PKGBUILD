# Maintainer: Arch User <arch@example.com>
pkgname=tristar-esports-git
_pkgname=tristar-esports
pkgver=r1.542d131
pkgrel=1
pkgdesc="TriStar Esports client built with Qt6 WebEngine"
arch=('x86_64')
url="https://gitee.com/jxc20120414/tristar-esports"
license=('custom')
depends=('qt6-webengine')
makedepends=('cmake' 'qt6-base' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://gitee.com/jxc20120414/tristar-esports.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cmake -S "${srcdir}/${_pkgname}" -B build \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    install -Dm755 build/DimensionEsports "${pkgdir}/usr/bin/dimension-esports"

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/tristar-esports.desktop" <<'EOF'
[Desktop Entry]
Name=TriStar Esports
Name[zh_CN]=三角星电竞
Comment=TriStar Esports Client
Exec=dimension-esports
Icon=tristar-esports
Terminal=false
Type=Application
Categories=Game;
EOF

    install -Dm644 "${srcdir}/${_pkgname}/1.jpg" "${pkgdir}/usr/share/pixmaps/tristar-esports.jpg"
}
