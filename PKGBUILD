# Maintainer: Hubert Jarosz <marqin.pl+aur at gmail dot com> PGP: 0xFFECF63C1AAB83FF

pkgname=renderdoc
pkgver=0.30
pkgrel=2
pkgdesc="OpenGL and Vulkan debugging tool"
arch=(i686 x86_64)
url="https://github.com/baldurk/renderdoc"
license=("MIT")
makedepends=("clang" "cmake" "vim")
depends=("qt5-x11extras" "libx11" "libxcb" "xcb-util-keysyms" "mesa" "mesa-libgl" "qt5-base")
source=("https://github.com/baldurk/renderdoc/archive/v$pkgver.tar.gz"
        "$pkgname.desktop")
sha384sums=("c852283b5124ca53193f898fde5b4089db745231fae4a7ebed824e84f34aa659d3508b8074f99ac7db1e3587c3fbbba3"
            "965214960726d34efd08d82a879c75e20e49769e5d7c7d996b570f2754f4688a7331267e0a0e2c54dea1eea3c1ad9e38")

build() {
  cd $pkgname-$pkgver
  make CXX=clang++
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
