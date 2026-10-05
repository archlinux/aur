pkgname=electron-castlab-bin
pkgver=v44.5.1+wvcus
pkgrel=1
pkgdesc="Electron for Content Security (ECS) is a fork of Electron created by castLabs to facilitate the use of Google's Widevine Content Decryption Module (CDM) for DRM-enabled playback within Electron"
arch=("x86_64" "aarch64")
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
sha256sums=('354a67d856e5940040371daa01328a80d7184c564f746f5565e4038c126d203c'
            'b3be2089b97573fc4bd8e5e9b9ded130c9b8c665eeee73d6fde78f1fbbdca0b6'
            '27eee4f74b719af2c24e1ca45ea6c5fc598863f5dba49180e2c22510c42be3c3')
sha256sums_x86_64=('afa7d4ea49abf1e91c5be0f88cfe1abdb977ff3454d57658e90b004aacbde9cc')
sha256sums_aarch64=('4c8254f1719e7596e3e5661a2c7922591bd3c5eb2dacd74fb96b022ea291ea95')
source_aarch64=("https://github.com/castlabs/electron-releases/releases/download/$pkgver/electron-$pkgver-linux-arm64.zip")
source_x86_64=("https://github.com/castlabs/electron-releases/releases/download/$pkgver/electron-$pkgver-linux-x64.zip")
source=("electroncastlab" "electroncastlab.desktop" "linux-app-id.js")

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
