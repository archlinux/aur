# Maintainer: allanfreitas <allanfreitas at gmail>

pkgname=antigravity-updated
pkgver=2.13.0
pkgrel=1
pkgdesc='Google Antigravity 2.0 multi-agent orchestration platform'
arch=(aarch64 x86_64)
url=https://antigravity.google/product/antigravity-2
license=(LicenseRef-Google-Antigravity)
provides=(antigravity)
conflicts=(antigravity)
depends=(alsa-lib
         at-spi2-core
         cairo
         dbus
         expat
         glib2
         glibc
         gtk3
         libcups
         libgcc
         libx11
         libxcb
         libxcomposite
         libxdamage
         libxext
         libxfixes
         libxkbcommon
         libxrandr
         mesa
         nspr
         nss
         pango
         systemd-libs)
options=(!strip !debug)
source=(antigravity.desktop
        antigravity.png)
# ---- Update these three variables on each new release ----
_build=6362815968182272
source_x86_64=(Antigravity-$pkgver-x86_64.tar.gz::https://storage.googleapis.com/antigravity-public/antigravity-hub/$pkgver-$_build/linux-x64/Antigravity.tar.gz)
source_aarch64=(Antigravity-$pkgver-aarch64.tar.gz::https://storage.googleapis.com/antigravity-public/antigravity-hub/$pkgver-$_build/linux-arm/Antigravity.tar.gz)
b2sums=('ec2c74f0e6f2458f2ef1c67b1321c058a3f7c422e364d8871a0a933220ec52ee5736e449cb797b6f135cff1f4adfe6f81e0fdbc76d3ec67c245aea002b8577d8'
        '772849ebf4574dccc7d2fc30751baed10b4a5d4091c524f3d69938192387693501c0c54ea5b43fa2ed382f70ecdff369a4c65ce3d0f778c68712fa0c2b5e84b8')
b2sums_aarch64=('a83e260859bbd53a5eddf7bb268737946b9e3957ad793ebad24046055776ee4d1e75ba0ba33baf6c343392a3cec5ccaaff9aeae5a1c81c87d0f87457ddb29026')
b2sums_x86_64=('c3201c068eaee99636576aaa1d3680aee82b2211ece8822b2f98a7e776d0da717b6f5c5097d3b27bb4a29d23a566021a086916303b1d820f0cd7648b6f1ff162')
# ----------------------------------------------------------

package() {
    install -d "$pkgdir/opt"
    cp -a Antigravity-*/ "$pkgdir/opt/Antigravity"

    install -d "$pkgdir/usr/bin"
    ln -s /opt/Antigravity/antigravity "$pkgdir/usr/bin/antigravity"

    install -d "$pkgdir/usr/share/licenses/antigravity"
    ln -s /opt/Antigravity/LICENSE.electron.txt -t "$pkgdir/usr/share/licenses/antigravity"
    ln -s /opt/Antigravity/LICENSES.chromium.html -t "$pkgdir/usr/share/licenses/antigravity"

    install -Dm644 antigravity.desktop -t "$pkgdir/usr/share/applications"
    install -Dm644 antigravity.png -t "$pkgdir/usr/share/pixmaps"
}
