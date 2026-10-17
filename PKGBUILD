# Maintainer: Nikolas Koesling <nikolas@koesling.network>

pkgname=open-ag-dsp
pkgrel=1
pkgver=0.0.1
pkgdesc="[vibe coded alpha!] GUI/CLI applications to control Yamaha AG03/AG06 audio interfaces"
url="https://gitlab.com/NikolasK-source/open-ag-dsp"
license=('MIT')
arch=('x86_64' 'aarch64')
makedepends=('cmake' 'cxxopts' 'gtest')
source=("git+https://gitlab.com/NikolasK-source/open-ag-dsp.git#tag=v${pkgver}")
depends=('portmidi')
install="${pkgname}.install"

sha256sums=('SKIP')

prepare() {
    cd open-ag-dsp
    mkdir -p build
    cmake -DCMAKE_BUILD_TYPE=Release -DCLANG_FORMAT=OFF -DCOMPILER_WARNINGS=OFF -DCLANG_TIDY=OFF -DBUILD_DOC=OFF -DCPPCHECK=OFF -B build .
}

build() {
    cd open-ag-dsp
    cmake --build build -j "$(nproc)"
}

package() {
    cd open-ag-dsp
    cmake --install build --config Release --prefix "${pkgdir}/usr"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 src/ag-gui/ag-gui.desktop "${pkgdir}/usr/share/applications/open-ag-dsp.desktop"
}
