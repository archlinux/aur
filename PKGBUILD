# Contributor: Florian B <mr.maxmeier at gmail dot com>
# Maintainer: Angelo Theodorou <encelo at gmail dot com>

pkgname=tracy
pkgver=0.8.2
pkgrel=2
pkgdesc="Real-time, nanosecond resolution frame profiler"
arch=('i686' 'x86_64')
url="https://github.com/wolfpld/tracy"
license=('BSD')
depends=('glfw-x11' 'gtk3' 'intel-tbb' 'capstone' 'xdg-desktop-portal')
makedepends=('pkgconf' 'git')
provides=('tracy')
conflicts=('tracy')
source=("git+$url#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd tracy
  make -C profiler/build/unix release
  make -C update/build/unix release
  make -C capture/build/unix release
}

package() {
  cd tracy
  install -Dm755 profiler/build/unix/Tracy-release $pkgdir/usr/bin/tracy
  install -Dm755 update/build/unix/update-release $pkgdir/usr/bin/tracy-update
  install -Dm755 capture/build/unix/capture-release $pkgdir/usr/bin/tracy-capture

  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 extra/desktop/tracy.desktop $pkgdir/usr/share/applications/tracy.desktop
  install -Dm644 icon/icon.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/tracy.svg
  install -Dm644 extra/desktop/application-tracy.xml $pkgdir//usr/share/mime/packages/application-tracy.xml
  install -Dm644 icon/application-tracy.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/application-tracy.svg
}
