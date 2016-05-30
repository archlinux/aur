# Maintainer: Hubert Jarosz <marqin.pl+aur at gmail dot com> PGP: 0xFFECF63C1AAB83FF

pkgname=renderdoc
pkgver=0.29
pkgrel=1
pkgdesc="OpenGL and Vulkan debugging tool"
arch=(i686 x86_64)
url="https://github.com/baldurk/renderdoc"
license=("MIT")
makedepends=("clang")
depends=("qt5-x11extras")
source=("https://github.com/baldurk/renderdoc/archive/v$pkgver.tar.gz"
        "$pkgname.desktop"
        "patch.diff")
sha384sums=("8e9525e5eded6939499ec06864035e5fc43904fe65d80e0709d37bb65a96154818243b1c6f21d93a6c5f676c78208f78"
            "965214960726d34efd08d82a879c75e20e49769e5d7c7d996b570f2754f4688a7331267e0a0e2c54dea1eea3c1ad9e38"
            "63912ebeb8b07a18659ea6ceb6de70d7e97f943fb07e4e4a0153760cb9d3fc0885fab8b9a96a0daf4e19fccfa2ff7ea1")

build() {
  cd $pkgname-$pkgver
  patch -p1 < ../patch.diff
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
