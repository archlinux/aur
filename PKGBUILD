pkgname=badapple-ascii-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Bad Apple!! ASCII art player for terminal (🌟 Features synchronized AUDIO playback!)"
arch=('x86_64')
url="https://github.com/reimunyancat/badapple-with-ascii"
license=('MIT')
depends=('sfml' 'gcc-libs' 'bash')
makedepends=('git' 'ffmpeg' 'python' 'python-numpy' 'python-pillow')
provides=('badapple')
conflicts=('badapple')
source=("git+https://github.com/reimunyancat/badapple-with-ascii.git")
sha256sums=('SKIP')

pkgver() {
cd "${srcdir}/badapple-with-ascii"
printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
cd "${srcdir}/badapple-with-ascii"
g++ -std=c++17 -O2 main.cpp -o badapple-ascii -lsfml-audio -lsfml-system
}

package() {
cd "${srcdir}/badapple-with-ascii"

mkdir -p "${pkgdir}/usr/share/badapple-with-ascii"
install -Dm755 badapple-ascii "${pkgdir}/usr/share/badapple-with-ascii/badapple-ascii"
cp -r BA_frame "${pkgdir}/usr/share/badapple-with-ascii/"
install -Dm644 bad_apple.mp3 "${pkgdir}/usr/share/badapple-with-ascii/bad_apple.mp3"

mkdir -p "${pkgdir}/usr/bin"
echo '#!/bin/bash' > "${pkgdir}/usr/bin/badapple"
echo 'cd /usr/share/badapple-with-ascii' >> "${pkgdir}/usr/bin/badapple"
echo 'exec ./badapple-ascii "$@"' >> "${pkgdir}/usr/bin/badapple"
chmod 755 "${pkgdir}/usr/bin/badapple"
}
