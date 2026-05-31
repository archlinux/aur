#Maintainer: Tonsoff
pkgname=tstype
pkgver=0.1.0
pkgrel=1
pkgdesc="A very simple text editor (Beta version)"
arch=('x86_64')
url="https://github.com/Tonsoff/tstype"
license=('GPL-3.0-only')
depends=('qt6-base' 'gcc-libs' 'glibc')
makedepends=('cmake' 'git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1c85b32377eaab0092e363a9dcc6152f586a5d01fac654fc1b8242bb35dbb1b6')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    cmake -B build -S . \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # 1. Установка бинарника
    install -Dm755 build/tstype "${pkgdir}/usr/bin/tstype"

    # 2. Создание и установка .desktop файла в системную директорию
    install -dm755 "${pkgdir}/usr/share/applications"
    cat <<EOF > "${pkgdir}/usr/share/applications/tstype.desktop"
[Desktop Entry]
Type=Application
Name=TsType
Comment=Simple text editor
Exec=tstype %F
Icon=text-editor
Terminal=false
Categories=Utility;TextEditor;Development;
MimeType=text/plain;
EOF
}

