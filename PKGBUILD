# Maintainer: Edoardo Morassutto <edoardo.morassutto@gmail.com>

pkgname=cli11
pkgver=1.6.0
pkgrel=2
pkgdesc='Command line parser for C++11'
arch=('any')
url='https://github.com/CLIUtils/CLI11'
license=('CUSTOM')
makedepends=('cmake')
source=("https://github.com/CLIUtils/CLI11/archive/v${pkgver}.zip"
        "https://raw.githubusercontent.com/CLIUtils/CLI11/v${pkgver}/LICENSE")
sha256sums=('f6b74aab81da1dc0bf719d920320b14a194a347379b805bd28e7e5e1ff55cfa8'
            '8dc15a2096fcd14a09fa59b070f0a2824f5698d0786f8a416c08958eeef19f18')

build() {
    cd "${srcdir}/CLI11-$pkgver"
    mkdir -p build
    cd build
    cmake .. -DCLI11_TESTING=OFF -DCLI11_EXAMPLES=OFF
    make
}

package() {
    cd "${srcdir}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/cli11/LICENSE"
    cd "CLI11-$pkgver/build"
    make DESTDIR="${pkgdir}" install
}
