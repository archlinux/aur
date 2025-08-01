pkgname=electron-castlab-bin
pkgver=v37.2.4+wvcus
pkgrel=1
arch=("x86_64")
url="https://github.com/castlabs/electron-releases"
license=('GPL')
depends=(c-ares
         gcc-libs
         glibc
         gtk3
         libevent
         libffi
         libpulse
         nss
         zlib)
pkgdesc="Electron for Content Security (ECS) is a fork of Electron created by castLabs to facilitate the use of Google's Widevine Content Decryption Module (CDM) for DRM-enabled playback within Electron"
sha256sums=('fc936e5aa0f1aac5ad97bd42d0685233e156ba789d24a4899e0641261f5a9a6f'
            'b3be2089b97573fc4bd8e5e9b9ded130c9b8c665eeee73d6fde78f1fbbdca0b6')
sha256sums_x86_64=('73092cc3021d3af76c29a75a2c32f14c5c5bb38cea16c62b62b84d9563af666f')
source_x86_64=("https://github.com/castlabs/electron-releases/releases/download/$pkgver/electron-$pkgver-linux-x64.zip")
source=("electroncastlab" "electroncastlab.desktop")

package() {
    install -dm755 "$pkgdir/usr/lib/electron-castlab"
    install -dm755 "$pkgdir/usr/bin"
    
    cd "$srcdir"
    cp -r "$srcdir"/* "$pkgdir/usr/lib/electron-castlab"
    install -Dm755 "$srcdir/electroncastlab" "$pkgdir/usr/bin/electroncastlab"

   # Desktop Entry
   install -Dm644 "$srcdir/electroncastlab.desktop" \
        "$pkgdir/usr/share/applications/electroncastlab.desktop"
   sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/electroncastlab.desktop"
}
