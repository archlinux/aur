# Contributor: Florian B <mr.maxmeier at gmail dot com>
# Maintainer: Angelo Theodorou <encelo at gmail dot com>

pkgname=tracy
pkgver=0.8
pkgrel=3
pkgdesc="Real-time, nanosecond resolution frame profiler"
arch=('i686' 'x86_64')
url="https://github.com/wolfpld/tracy"
license=('BSD')
depends=('glfw-x11' 'gtk3' 'intel-tbb' 'capstone')
makedepends=('pkgconf' 'git')
provides=('tracy')
conflicts=('tracy')
source=("git+$url#tag=v$pkgver" "tracy.desktop" "application-tracy.xml" "application-tracy.svg")
sha256sums=('SKIP'
            'd3e0e3433e10a154ed38103a98600585a20ac49212f53370b2ead89971f47652'
            'f814d8f15a25b0014ca5781ae2b8941326c9f1e777d61368ec4c5128f3ddefcb'
            '2f65177164c7601aef7b204d12c9e8dd94930056472d8f22d14339072cc6c8fb')


build() {
  cd tracy
  make -C profiler/build/unix release
  make -C update/build/unix release
  make -C capture/build/unix release
}

package() {
  install -Dm644 tracy.desktop $pkgdir/usr/share/applications/tracy.desktop
  install -Dm644 application-tracy.xml $pkgdir//usr/share/mime/packages/application-tracy.xml
  install -Dm644 application-tracy.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/application-tracy.svg

  cd tracy
  install -Dm755 profiler/build/unix/Tracy-release $pkgdir/usr/bin/tracy
  install -Dm755 update/build/unix/update-release $pkgdir/usr/bin/tracy-update
  install -Dm755 capture/build/unix/capture-release $pkgdir/usr/bin/tracy-capture
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 icon/icon.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/tracy.svg
}
