pkgname=ruffle-bin
pkgver=2024.07.19
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
sha256sums_i386=('6f848d8bf331c6cff9332dd7da33435aca5cae2cfa4bebc62752c27dd6308673'
                 '8da444245d65a4031ab8e9ba151b1ec0041fbe1c0836f6353e7c90b18833197b')
sha256sums_pentium4=('6f848d8bf331c6cff9332dd7da33435aca5cae2cfa4bebc62752c27dd6308673'
                     '8da444245d65a4031ab8e9ba151b1ec0041fbe1c0836f6353e7c90b18833197b')
sha256sums_i686=('6f848d8bf331c6cff9332dd7da33435aca5cae2cfa4bebc62752c27dd6308673'
                 '8da444245d65a4031ab8e9ba151b1ec0041fbe1c0836f6353e7c90b18833197b')
sha256sums_x86_64=('b5434257c2373c922a5e5693423a2bd58a665770559ab39d605f07e9fdd0680c'
                   '8da444245d65a4031ab8e9ba151b1ec0041fbe1c0836f6353e7c90b18833197b')
sha256sums_aarch64=('a8806801fea4bc04487b815e1769255aef2804eb4d5527e7a0ae47829a5df14b'
                    '8da444245d65a4031ab8e9ba151b1ec0041fbe1c0836f6353e7c90b18833197b')
source_x86_64=("https://gitlab.com/linuxbombay/ruffle-linux/binaries/ruffle-$pkgver/-/raw/main/ruffle-x64.tar.xz" 
"https://gitlab.com/linuxbombay/ruffle-linux/ruffle-packaging/-/archive/$scriptver/ruffle-packaging-$scriptver.tar.bz2")

source_i386=("https://gitlab.com/linuxbombay/ruffle-linux/binaries/ruffle-$pkgver/-/raw/main/ruffle-i686.tar.xz" 
"https://gitlab.com/linuxbombay/ruffle-linux/ruffle-packaging/-/archive/$scriptver/ruffle-packaging-$scriptver.tar.bz2")

source_pentium4=("https://gitlab.com/linuxbombay/ruffle-linux/binaries/ruffle-$pkgver/-/raw/main/ruffle-i686.tar.xz" 
"https://gitlab.com/linuxbombay/ruffle-linux/ruffle-packaging/-/archive/$scriptver/ruffle-packaging-$scriptver.tar.bz2")

source_i686=("https://gitlab.com/linuxbombay/ruffle-linux/binaries/ruffle-$pkgver/-/raw/main/ruffle-i686.tar.xz" 
"https://gitlab.com/linuxbombay/ruffle-linux/ruffle-packaging/-/archive/$scriptver/ruffle-packaging-$scriptver.tar.bz2")

source_aarch64=("https://gitlab.com/linuxbombay/ruffle-linux/binaries/ruffle-$pkgver/-/raw/main/ruffle-arm64.tar.xz" 
"https://gitlab.com/linuxbombay/ruffle-linux/ruffle-packaging/-/archive/$scriptver/ruffle-packaging-$scriptver.tar.bz2")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/pixmaps"
    install -dm755 "$pkgdir/usr/lib"
    
    for dir in $srcdir/ruffle-packaging-* ; do mv "${dir}" "ruffle-packaging" ;done
    # Link to binary
    install -Dm755 "$srcdir/ruffle" "$pkgdir/usr/bin"
    find "$srcdir" -type f -name "libopenh264-*.so" -exec mv {} "$pkgdir/usr/lib" \;

    # Desktop Entry
    cp -r "$srcdir/ruffle-packaging/ruffle.svg" "$pkgdir/usr/share/pixmaps"
    install -Dm644 "$srcdir/ruffle-packaging/ruffle.desktop" \
    "$pkgdir/usr/share/applications/ruffle.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/ruffle.desktop"
}
