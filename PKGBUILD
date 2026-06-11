pkgname=lindora
pkgver=1.1
pkgrel=0
pkgdesc="An unofficial site-specific browser wrapper for the Pandora web service."
arch=('x86_64')
url=https://github.com/Logawinner/Lindora
license=('custom')
depends=('qt6-base' 'qt6-webengine' 'qt6-svg')
makedepends=('cmake')

# List your local files, and the remote icon URL
source=('main.cpp' 'CMakeLists.txt' 'lindora-native.desktop'
        "https://raw.githubusercontent.com/Logawinner/Lindora/main/Lindora.svg")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

build() {
    cmake -B build -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    # Install the binary
    install -Dm755 build/lindora-native "${pkgdir}/usr/bin/lindora-native"
    
    # Install the icon (downloaded from the web)
    # Since it is a remote file, it lands in the base $srcdir
    install -Dm644 "${srcdir}/Lindora.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/lindora.svg"
    
    # Install the desktop entry
    install -Dm644 lindora-native.desktop "${pkgdir}/usr/share/applications/lindora-native.desktop"
}
