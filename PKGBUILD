# Maintainer: Hubert Jarosz <marqin.pl+aur at gmail dot com> PGP: 0xFFECF63C1AAB83FF

pkgname=renderdoc
pkgver=0.31
pkgrel=1
pkgdesc="OpenGL and Vulkan debugging tool"
arch=(i686 x86_64)
url="https://github.com/baldurk/renderdoc"
license=("MIT")
makedepends=("cmake")
depends=("qt5-x11extras" "libx11" "libxcb" "xcb-util-keysyms" "mesa" "libgl" "qt5-base")
source=("https://github.com/baldurk/renderdoc/archive/v$pkgver.tar.gz"
        "$pkgname.desktop")
sha384sums=("35da8344f486b6d7584056a9be75e31cc8a0ba51dff0c33b7d9a5e18a69a3d7f3babbd83f28d9d3cde92825cb40c5e81"
            "965214960726d34efd08d82a879c75e20e49769e5d7c7d996b570f2754f4688a7331267e0a0e2c54dea1eea3c1ad9e38")

build() {
  cd $pkgname-$pkgver

  export CXX=g++

  cmake -DCMAKE_BUILD_TYPE=Release -DENABLE_QRENDERDOC=OFF -Bbuild -H.
  make -C build
}

package() {
  #install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  cd $pkgname-$pkgver/build/bin
  install -Dm644 librenderdoc.so "$pkgdir/usr/lib/librenderdoc.so"
  #install -Dm755 qrenderdoc "$pkgdir/usr/bin/qrenderdoc"
  install -Dm755 renderdoccmd "$pkgdir/usr/bin/renderdoccmd"
  cd ../..
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  cd docs/imgs
  install -Dm644 logo.png "$pkgdir/usr/share/icons/$pkgname.png"
}
