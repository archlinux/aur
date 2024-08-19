pkgname=ruffle-bin
pkgver=2024.08.19
pkgrel=1
scriptver=1.0.2
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
sha256sums_i386=('4dfb6e74aed87415a2be4cfd852e7e7034231848ebb070b1e7b4e2bbeab87674'
                 'f043303d00abda09e5f23823cd9211b16b9448ac81f87b3c609e7158d4ef5920')
sha256sums_pentium4=('4dfb6e74aed87415a2be4cfd852e7e7034231848ebb070b1e7b4e2bbeab87674'
                     'f043303d00abda09e5f23823cd9211b16b9448ac81f87b3c609e7158d4ef5920')
sha256sums_i686=('4dfb6e74aed87415a2be4cfd852e7e7034231848ebb070b1e7b4e2bbeab87674'
                 'f043303d00abda09e5f23823cd9211b16b9448ac81f87b3c609e7158d4ef5920')
sha256sums_x86_64=('6f848d8bf331c6cff9332dd7da33435aca5cae2cfa4bebc62752c27dd6308673'
                   'f043303d00abda09e5f23823cd9211b16b9448ac81f87b3c609e7158d4ef5920')
sha256sums_aarch64=('e3b9cddf5f47bebf8bf68a3acdd418a3d778e59bc79b05a3e466f59ca87cd55b'
                    'f043303d00abda09e5f23823cd9211b16b9448ac81f87b3c609e7158d4ef5920')
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
