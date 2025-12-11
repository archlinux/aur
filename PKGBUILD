# Maintainer: endlesseden <endlesseden [at] deep-rose [dot] org>
# Original Maintainer(altrace-hg): Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=altrace-git
pkgver=20210831.r23.dd572d9
pkgrel=1
pkgdesc="Debugging tool for applications that use OpenAL for audio"
arch=('x86_64')
url='https://icculus.org/altrace/'
license=('zlib')
makedepends=('cmake' 'ninja')
source=('git+https://github.com/icculus/altrace.git')
sha256sums=('SKIP')
provides=(altrace)
conflicts=(altrace)

pkgver() {
  cd altrace
  date="$(git log -1 --format=%cd --date=format:%Y%m%d | head -1)"
  echo $date.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cmake \
    -G Ninja \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -S altrace -B build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
