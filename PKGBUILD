# Maintainer: Nick Pilipenko <nick.pilipenko <at> gmail <dot> com>
# Contributor: Ding Xiao <tinocodfcdsa10@mails.tsinghua.edu.cn>
# Contributor: Syn Waker <syncrtl64@gmail.com>

pkgname=gdx-setup
pkgver=1.12.1
pkgrel=1
#epoch=1
pkgdesc="LibGDX project setup"
arch=('any')
url="https://libgdx.com"
license=('APACHE')
depends=('java-environment')

source=("$pkgname-$pkgver.tar.gz::https://github.com/libgdx/libgdx/archive/refs/tags/$pkgver.tar.gz"
        "gdx-setup"
        "gdx-setup.desktop"
)

sha256sums=('c76eb45d990332d380063ec5d74c6a62b9dbe54c4f091f831ecfa8a1c6b28f87'
            '995e6025a45506df2e23661a3b703047cdb58ae8a4dcc5abce097c30ca666613'
            'b2bb727a902caf7101efa5f8103421528b7d6e2ebfc4faf33d181c63c82814f6')

jsrc=libgdx-$pkgver

build() {
  cd $jsrc
  #build gdx-setup target only
  echo "Run build script in directory: `pwd`"
  bash ./gradlew build -p extensions/gdx-setup
}

package() {
  jtarget=$srcdir/$jsrc/extensions/gdx-setup/build/libs/$pkgname.jar
  cd $srcdir
  chmod +x gdx-setup
  mkdir -p $pkgdir/usr/{share/java/$pkgname/,bin,share/pixmaps,share/applications}
  install -Dm644 $jtarget $pkgdir/usr/share/java/$pkgname/
  install -Dm644 $srcdir/$jsrc/libgdx_logo.svg $pkgdir/usr/share/pixmaps/gdx-setup.svg
  install -Dm644 gdx-setup.desktop $pkgdir/usr/share/applications/
  install -Dm755 gdx-setup $pkgdir/usr/bin
}
