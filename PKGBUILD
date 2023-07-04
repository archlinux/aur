# Maintainer: Aron Young <tkf6fkt at gmail dot com>

pkgname=flat-bin
pkgver=2.2.3
pkgrel=1
pkgdesc="the client of Agora Flat open source classroom."
arch=(x86_64 aarch64)
url="https://flat.whiteboard.agora.io/"
license=('MIT')
depends=(electron12 bash)
provides=(flat)
source=("https://flat-storage.oss-accelerate.aliyuncs.com/versions/latest/stable/win/Flat-x64-$pkgver.exe"
    "https://raw.githubusercontent.com/netless-io/flat/main/LICENSE"
    $pkgname.desktop
)
md5sums=('dcb2a9a765f7e4db74f4e4019e26a7e5'
         '51dc5dc7139da3157a898b0265f34ab6'
         '1d7d38434279d9a35429cd2546df622e')

package() {
    install -d "$pkgdir"/opt/$pkgname
    find . -name "resources" -type d -exec cp -av {} $pkgdir/opt/$pkgname/ \;
    echo -e "#!/bin/bash\nelectron12 /opt/$pkgname/resources/app.asar" | install -Dm755 /dev/stdin $pkgdir/usr/bin/flat
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 $pkgname.desktop -t "$pkgdir"/usr/share/applications/
    find . -name "logo-2844c382.svg" -exec install -Dm644 {} "$pkgdir"/usr/share/pixmaps/$pkgname.svg \;
}
