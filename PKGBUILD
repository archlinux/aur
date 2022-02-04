# Maintainer: tytan652 <tytan652@tytanium.xyz>

_reponame=obs-ptz
pkgname=$_reponame-controls
pkgver=0.10.4
pkgrel=2
pkgdesc="Plugin for OBS Studio to add a PTZ Camera control dock"
arch=("i686" "x86_64" "aarch64")
url="https://obsproject.com/forum/resources/ptz-controls.1284/"
license=("GPL2")
depends=("obs-studio" "qt5-gamepad" "qt5-serialport")
makedepends=("cmake")
options=('debug')
source=("$_reponame-$pkgver.tar.gz::https://github.com/glikely/$_reponame/archive/v$pkgver.tar.gz")
sha256sums=("a3b19835697c837eb318ae507fa13eb8b70f03b3490e26227b6406b910354c4b")

build() {
  cd "$_reponame-$pkgver"

  cmake -B build \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DCMAKE_INSTALL_PREFIX='/usr'

  make -C build
}

package() {
  cd "$_reponame-$pkgver"

  make -C build DESTDIR="$pkgdir/" install
}
