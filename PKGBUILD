pkgname=nzp-bin
pkgver=2.0.0indev20240623071843
pkgrel=2
scriptver=1.0.1
pkgdesc='Nazi Zombies: Portable, a Call of Duty: Zombies "de-make" powered by various enhanced forks of the Quake engine'
arch=('x86_64' 'i686' 'i386' 'aarch64' 'armv7l')
url="https://gitlab.com/linuxbombay/nzp"
license=('GPL2')
makedepends=('unzip')
_pkgrel_x86_64=1
_pkgrel_aarch64=1
_pkgrel_i386=1
_pkgrel_i686=1
sha256sums_x86_64=('5ad502db1edb809b67f8d1a830ad9cd1a0fb1e419fcfed9fe2732e7ffd4a4d0b'
                   'ec5a66aed0939e79a4e8edbe3b6f738e866a208058398db0b5a7711426f0f639')
sha256sums_i686=('5ad502db1edb809b67f8d1a830ad9cd1a0fb1e419fcfed9fe2732e7ffd4a4d0b'
                 '2aa4be18a7a2dbc700bebd10b59e7ec8ebe6b232a211f74391d3fb0b48a898a3')
sha256sums_i386=('5ad502db1edb809b67f8d1a830ad9cd1a0fb1e419fcfed9fe2732e7ffd4a4d0b'
                 '2aa4be18a7a2dbc700bebd10b59e7ec8ebe6b232a211f74391d3fb0b48a898a3')
sha256sums_aarch64=('5ad502db1edb809b67f8d1a830ad9cd1a0fb1e419fcfed9fe2732e7ffd4a4d0b'
                    '31febe6f282ad948245f187bb4759603db174991829b9f3bf2afbb647dbbabe0')
sha256sums_armv7l=('5ad502db1edb809b67f8d1a830ad9cd1a0fb1e419fcfed9fe2732e7ffd4a4d0b'
                   'eb0a9f90ec2a02eea021ce1cf7ee68825276727ce3248f23e4cd8018207bd237')
source_x86_64=("https://gitlab.com/linuxbombay/nzp/nzp-packaging/-/archive/$scriptver/nzp-packaging-$scriptver.tar.bz2" "https://gitlab.com/linuxbombay/nzp/binaries/$pkgver/-/raw/main/nzportable-linux64.zip")
source_aarch64=("https://gitlab.com/linuxbombay/nzp/nzp-packaging/-/archive/$scriptver/nzp-packaging-$scriptver.tar.bz2" "https://gitlab.com/linuxbombay/nzp/binaries/$pkgver/-/raw/main/nzportable-linuxarm64.zip")
source_armv7l=("https://gitlab.com/linuxbombay/nzp/nzp-packaging/-/archive/$scriptver/nzp-packaging-$scriptver.tar.bz2" "https://gitlab.com/linuxbombay/nzp/binaries/$pkgver/-/raw/main/nzportable-linuxarmhf.zip")
source_i386=("https://gitlab.com/linuxbombay/nzp/nzp-packaging/-/archive/$scriptver/nzp-packaging-$scriptver.tar.bz2" "https://gitlab.com/linuxbombay/nzp/binaries/$pkgver/-/raw/main/nzportable-linux32.zip")
source_i686=("https://gitlab.com/linuxbombay/nzp/nzp-packaging/-/archive/$scriptver/nzp-packaging-$scriptver.tar.bz2" "https://gitlab.com/linuxbombay/nzp/binaries/$pkgver/-/raw/main/nzportable-linux32.zip")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/pixmaps"
    install -dm755 "$pkgdir/usr/share/games/NZP"
    install -dm755 "$pkgdir/usr/share/applications"
    
    cd $srcdir
    find -type f -name "*nzportable*" -exec cp -r {} "nzportable" \;
    install -Dm755 "nzportable" "$pkgdir/usr/share/games/NZP/nzportable"
    cp -r nzp "$pkgdir/usr/share/games/NZP"
    cp -r default.fmf "$pkgdir/usr/share/games/NZP"
    cp -r "$srcdir/nzp-packaging-$scriptver/nzp.svg" "$pkgdir/usr/share/pixmaps"
    cp -r "$srcdir/nzp-packaging-$scriptver/nzp-title.png" "$pkgdir/usr/share/games/NZP"
    
    # Link to binary
    install -Dm755 "$srcdir/nzp-packaging-$scriptver/nzp.sh" "$pkgdir/usr/bin/nzp"

    # Desktop Entry
    install -Dm644 "$srcdir/nzp-packaging-$scriptver/nzp.desktop" \
        "$pkgdir/usr/share/applications/nzp.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/nzp.desktop"
}
