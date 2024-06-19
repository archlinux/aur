pkgname=ruffle-bin
pkgver=2024.06.18
pkgrel=1
_pkgrel_x86_64=1
_pkgrel_i386=1
_pkgrel_i668=1
_pkgrel_pentium4=1
_pkgrel_aarch64=1
pkgdesc="Unnofficial Ruffle bin package that supplies binaries for Linux x64, i368 and Arm64"
arch=('i386' 'pentium4' 'i686' 'x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/ruffle-linux"
license=('Apache' 'MIT')
depends=('gtk3' 'libxcb' 'zlib' 'libxcb' 'alsa-lib' 'libxkbcommon-x11')
makedepends=('unzip')
conflicts=(ruffle-git)
sha256sums_i386=('aef27f8b595a9f8c35669a1176c6741401924a601a27ce92de893e36c407cf55'
                 'SKIP')
sha256sums_pentium4=('aef27f8b595a9f8c35669a1176c6741401924a601a27ce92de893e36c407cf55'
                     'SKIP')
sha256sums_i686=('aef27f8b595a9f8c35669a1176c6741401924a601a27ce92de893e36c407cf55'
                 'SKIP')
sha256sums_x86_64=('18ec66341ee0bb26f709d348f09abe0970f063ff61728a2a17aa4f2a97404d5f'
                   'SKIP')
sha256sums_aarch64=('0ce3678165a68bdec8ec62247d0fd6cefa35b982a31c4b6100af374dba68fd76'
                    'SKIP')
source_x86_64=("https://gitlab.com/linuxbombay/ruffle-linux/binaries/ruffle-$pkgver/-/raw/main/ruffle-x64.tar.xz" 
"git+https://gitlab.com/linuxbombay/ruffle-linux/ruffle.git")

source_i386=("https://gitlab.com/linuxbombay/ruffle-linux/binaries/ruffle-$pkgver/-/raw/main/ruffle-i686.tar.xz" 
"git+https://gitlab.com/linuxbombay/ruffle-linux/ruffle.git")

source_pentium4=("https://gitlab.com/linuxbombay/ruffle-linux/binaries/ruffle-$pkgver/-/raw/main/ruffle-i686.tar.xz" 
"git+https://gitlab.com/linuxbombay/ruffle-linux/ruffle.git")

source_i686=("https://gitlab.com/linuxbombay/ruffle-linux/binaries/ruffle-$pkgver/-/raw/main/ruffle-i686.tar.xz" 
"git+https://gitlab.com/linuxbombay/ruffle-linux/ruffle.git")

source_aarch64=("https://gitlab.com/linuxbombay/ruffle-linux/binaries/ruffle-$pkgver/-/raw/main/ruffle-arm64.tar.xz" 
"git+https://gitlab.com/linuxbombay/ruffle-linux/ruffle.git")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/pixmaps"
    for dir in ruffle-*/ ; do mv "${dir}" "$pkgname" ;done   

    # Link to binary
    cp "$srcdir/ruffle" "$pkgdir/usr/bin"
    
    # Desktop Entry
    cp -r "$srcdir/$pkgname/ruffle.svg" "$pkgdir/usr/share/pixmaps"
    install -Dm644 "$srcdir/$pkgname/ruffle.desktop" \
    "$pkgdir/usr/share/applications/ruffle.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/ruffle.desktop"
}
