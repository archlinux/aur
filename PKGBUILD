pkgname=nzp-bin
pkgver=2.0.0indev20240619071813
pkgrel=1
pkgdesc='Nazi Zombies: Portable, a Call of Duty: Zombies "de-make" powered by various enhanced forks of the Quake engine'
arch=('x86_64' 'i686' 'i386' 'aarch64' 'armv7l')
url="https://gitlab.com/linuxbombay/nzp"
license=('GPL2')
makedepends=('unzip')
_pkgrel_x86_64=1
_pkgrel_aarch64=1
_pkgrel_i386=1
_pkgrel_i686=1
sha256sums_x86_64=('SKIP'
                   '1c9d2fb86ff2636e1ea3bd0b53872f2a75a001b24673c4cb8d20875918d40001')
sha256sums_i686=('SKIP'
                 '41b0d568440970c05773351135b2c83392b8dd0392542862062bbb2784b08785')
sha256sums_i386=('SKIP'
                 '41b0d568440970c05773351135b2c83392b8dd0392542862062bbb2784b08785')
sha256sums_aarch64=('SKIP'
                    '5eb1608cfc0aa3ecaa38871fe3843076f30e4fba062bd0fde845d7c52c7f7972')
sha256sums_armv7l=('SKIP'
                   '239f74fd8890872bc75f0181b63a84d228bdd0ce46ab11b02e0058ba590044c9')
source_x86_64=("git+https://gitlab.com/linuxbombay/nzp/nzp-packaging.git" "https://gitlab.com/linuxbombay/nzp/binaries/$pkgver/-/raw/main/nzportable-linux64.zip")
source_aarch64=("git+https://gitlab.com/linuxbombay/nzp/nzp-packaging.git" "https://gitlab.com/linuxbombay/nzp/binaries/$pkgver/-/raw/main/nzportable-linuxarm64.zip")
source_armv7l=("git+https://gitlab.com/linuxbombay/nzp/nzp-packaging.git" "https://gitlab.com/linuxbombay/nzp/binaries/$pkgver/-/raw/main/nzportable-linuxarmhf.zip")
source_i386=("git+https://gitlab.com/linuxbombay/nzp/nzp-packaging.git" "https://gitlab.com/linuxbombay/nzp/binaries/$pkgver/-/raw/main/nzportable-linux32.zip")
source_i686=("git+https://gitlab.com/linuxbombay/nzp/nzp-packaging.git" "https://gitlab.com/linuxbombay/nzp/binaries/$pkgver/-/raw/main/nzportable-linux32.zip")

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
    cp -r "$srcdir/nzp-packaging/nzp.svg" "$pkgdir/usr/share/pixmaps"
    cp -r "$srcdir/nzp-packaging/nzp-title.png" "$pkgdir/usr/share/games/NZP"
    
    # Link to binary
    install -Dm755 "$srcdir/nzp-packaging/nzp.sh" "$pkgdir/usr/bin/nzp"

    # Desktop Entry
    install -Dm644 "$srcdir/nzp-packaging/nzp.desktop" \
        "$pkgdir/usr/share/applications/nzp.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/nzp.desktop"
}
