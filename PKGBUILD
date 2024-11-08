pkgname=cube2-bin
pkgver=2020.11.29
pkgrel=1
pkgdesc='Cube 2: Sauerbraten is a free and open-source Arena-FPS game. Its gameplay is similar to games like Quake, Doom or Unreal Tournament.'
arch=('i686' 'x86_64' 'aarch64')
url='https://gitlab.com/linuxbombay/sauerbraten-cube2'
license=('GPL2')
depends=('sdl2' 'sdl2_image')
sha256sums=('4b645944d8ffd230d9ad7d1cf6e81398df2be26152674154186677a928186304'
            'b18914f81c2fea13ed6fe29fcd41a2f936781c2454e2c871c61a71bfa868784e'
            '9ab3b9a7413463b07bf5e2ce163b8674fa4e6318c94eac9acedc034ae8b0b723')
sha256sums_i686=('0bbc755ac26fdcda530c907fd44f625afc3812048242b2c4289c5f5007f59362')
sha256sums_x86_64=('aa402bbcfc278a4759a1be8fd361eec00f8f47761d07b74080ac9261d686695e')
sha256sums_aarch64=('3c0a48d5474f2b4e726fcc259b66cf6d99c42721f9b7e84c9c2654154d8192a6')
source=("sauerbraten.desktop" "sauerbraten.svg" "sauerbraten")
source_i686=("sauerbraten-$pkgver-i686.tar.xz::$url/binaries/$pkgver/-/raw/main/sauerbraten-i686.tar.xz")
source_x86_64=("sauerbraten-$pkgver-x64.tar.xz::$url/binaries/$pkgver/-/raw/main/sauerbraten-x64.tar.xz")
source_aarch64=("sauerbraten-$pkgver-arm64.tar.xz::$url/binaries/$pkgver/-/raw/main/sauerbraten-arm64.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/pixmaps"
    install -dm755 "$pkgdir/usr/share/games/sauerbraten"
    
    find "$srcdir" -type f -name "*.cfg" -exec cp {} "$pkgdir/usr/share/games/sauerbraten/" \;
    cp -r "$srcdir/data" "$srcdir/docs" "$srcdir/packages" "$pkgdir/usr/share/games/sauerbraten/"
    install -Dm755 "$srcdir/sauer_client" "$pkgdir/usr/share/games/sauerbraten"
    install -Dm755 "$srcdir/sauer_server" "$pkgdir/usr/share/games/sauerbraten/"
    install -Dm755 "$srcdir/sauerbraten" "$pkgdir/usr/bin"
    install -Dm755 "$srcdir/sauerbraten.svg" "$pkgdir/usr/share/pixmaps"

    # Desktop Entry
        install -Dm644 "$srcdir/sauerbraten.desktop" \
    "$pkgdir/usr/share/applications/sauerbraten.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/sauerbraten.desktop"
}
