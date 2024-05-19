pkgname=ruffle-bin
pkgver=2024.05.19
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
sha256sums_i386=('3fd04c151f2e07fa913742617bf6efd896ab09484e991b4ba8b0799fb5b34587'
                 '4ee7e6ee5abd0a274bb1241ede2f3da1278691ab15fa80e4d94102dd68762f26')
sha256sums_pentium4=('3fd04c151f2e07fa913742617bf6efd896ab09484e991b4ba8b0799fb5b34587'
                     '4ee7e6ee5abd0a274bb1241ede2f3da1278691ab15fa80e4d94102dd68762f26')
sha256sums_i686=('3fd04c151f2e07fa913742617bf6efd896ab09484e991b4ba8b0799fb5b34587'
                 '4ee7e6ee5abd0a274bb1241ede2f3da1278691ab15fa80e4d94102dd68762f26')
sha256sums_x86_64=('8e2b94875de9955b5d5cbdf5b48d8a9e59539fafc1a6579e928da42ec2cfeb88'
                   '4ee7e6ee5abd0a274bb1241ede2f3da1278691ab15fa80e4d94102dd68762f26')
sha256sums_aarch64=('aa0c8dc3b64cea877824d010c24ff9afb6cf6e0cd2f17e096faa34d7d7427e9c'
                    '4ee7e6ee5abd0a274bb1241ede2f3da1278691ab15fa80e4d94102dd68762f26')
source_x86_64=("https://gitlab.com/linuxbombay/ruffle-linux/binaries/ruffle-$pkgver/-/raw/main/ruffle-x64.tar.xz" 
"https://gitlab.com/linuxbombay/ruffle-linux/ruffle/-/archive/ruffle-$pkgver/ruffle-$pkgver.tar.bz2")

source_i386=("https://gitlab.com/linuxbombay/ruffle-linux/binaries/ruffle-$pkgver/-/raw/main/ruffle-i686.tar.xz" 
"https://gitlab.com/linuxbombay/ruffle-linux/ruffle/-/archive/ruffle-$pkgver/ruffle-$pkgver.tar.bz2")

source_pentium4=("https://gitlab.com/linuxbombay/ruffle-linux/binaries/ruffle-$pkgver/-/raw/main/ruffle-i686.tar.xz" 
"https://gitlab.com/linuxbombay/ruffle-linux/ruffle/-/archive/ruffle-$pkgver/ruffle-$pkgver.tar.bz2")

source_i686=("https://gitlab.com/linuxbombay/ruffle-linux/binaries/ruffle-$pkgver/-/raw/main/ruffle-i686.tar.xz" 
"https://gitlab.com/linuxbombay/ruffle-linux/ruffle/-/archive/ruffle-$pkgver/ruffle-$pkgver.tar.bz2")

source_aarch64=("https://gitlab.com/linuxbombay/ruffle-linux/binaries/ruffle-$pkgver/-/raw/main/ruffle-arm64.tar.xz" 
"https://gitlab.com/linuxbombay/ruffle-linux/ruffle/-/archive/ruffle-$pkgver/ruffle-$pkgver.tar.bz2")

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
