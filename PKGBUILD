# Maintainer: Hubert Jarosz <marqin.pl+aur at gmail dot com> PGP: 0xFFECF63C1AAB83FF

pkgname=renderdoc
pkgver=0.27
pkgrel=3
pkgdesc="OpenGL and Vulkan debugging tool"
arch=(i686 x86_64)
url="https://github.com/baldurk/renderdoc"
license=("MIT")
depends=(qt5-x11extras)
source=("https://github.com/baldurk/renderdoc/archive/v$pkgver.tar.gz"
        "$pkgname.desktop" "patch1.diff" "patch2.diff")
sha256sums=('bcb3dba88d07c57ba84830578da9b49c56ff5071e33b3f97bdeb265fb0040a63'
            'eab4941dc17fbbdcb9e34a698c3b304d212be54956daeb0c3b1cf5b7f2b00984'
            'f166de9d2bb46b8d64e73e7e8afe026525ecfb58d47fc5dacf0b0fff7a57adf2'
            'bfcc7d9deb98110848f9376b490cc5b182aa90fd673beb822b56e5d21ae75b38')

build() {
  cd $pkgname-$pkgver
  patch -p1 < ../patch1.diff
  patch -p1 < ../patch2.diff
  make
}

package() {
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  cd $pkgname-$pkgver/bin
  install -Dm644 librenderdoc.so "$pkgdir/usr/lib/librenderdoc.so"
  install -Dm755 qrenderdoc "$pkgdir/usr/bin/qrenderdoc"
  install -Dm755 renderdoccmd "$pkgdir/usr/bin/"
  cd ..
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  cd docs/imgs
  install -Dm644 logo.png "$pkgdir/usr/share/icons/$pkgname.png"
}
