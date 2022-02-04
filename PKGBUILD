# Maintainer: tytan652 <tytan652@tytanium.xyz>

_pluginname=dvds3
pkgname=obs-$_pluginname
pkgver=1.1
pkgrel=4
pkgdesc="Will it hit the corner? OBS Studio plugin, which adds a dvd screen saver source type"
arch=("i686" "x86_64" "aarch64")
url="https://obsproject.com/forum/resources/dvd-screensaver.762/"
license=("GPL2")
depends=("obs-studio")
makedepends=("cmake" "libxcomposite")
provides=("obs-dvd-screensaver")
options=('debug')
# Use a commit hash to backport a fix and a recent CMakeLists.txt
source=("$_pluginname::git+https://github.com/univrsal/dvds3.git#commit=6bad0d4ac2dc908d18416256a6780967b8cdfeb0")
sha256sums=("SKIP")

build() {
  cd $_pluginname
  cmake -B build \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DGLOBAL_INSTALLATION=ON
  make -C build
}

package() {
  cd $_pluginname
  make -C build DESTDIR="$pkgdir/" install
}