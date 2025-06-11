# Maintainer: Entailz <entail-wraps0r at icloud dot com>

pkgname=quickshell
pkgver=v0.1.0
pkgrel=1
pkgdesc='Simple and flexbile QtQuick based desktop shell toolkit.'
arch=(x86_64 aarch64)
url='https://git.outfoxxed.me/quickshell/quickshell'
options=(!strip)
license=('GPL')
depends=(
  'qt6-declarative'
  'qt6-base'
  'jemalloc'
  'qt6-svg'
  'libpipewire'
  'qt6-wayland'
  'wayland-protocols'
  'libxcb'
  'wayland'
  'cli11'
  'libdrm'
  'mesa'
  'google-breakpad'
  'qt6-shadertools'
)
makedepends=(
  'ninja'
  'cmake'
  'pkgconf'
)
source=($pkgname-$pkgver.tar.gz::$url/archive/v0.1.0.tar.gz
  quickshell-check.hook)

sha256sums=('5962043c7d4264cc7d71445dc86e175d0fbb1701ce390c24f92c6371e24bc127'
            '8543e21aeaaa5441b73a679160e7601a957f16c433e8d6bd9257e80bd0e94083')
b2sums=('70bc328a133b2d6b736d130228a90270e9941d150748497e3e4144568f2c524e726c788c6778b1f3f408a369144548edfe2d98caf4031ed4430b5d1c93d2a990'
        'c729d8c05d0490eda0a4095d831f7fe4f2873debe0dd3dbb0de41a801ed652a885de7048cecc26eaddec9d22e68a7d00552ad3f3db96d80041671192faf0afe0')

build() {
  cd $pkgname
  cmake -GNinja -B build \
    -DCMAKE_BUILD_TYPE="RelWithDebInfo" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DDISTRIBUTOR="AUR (package: quickshell)" \
    -DDISTRIBUTOR_DEBUGINFO_AVAILABLE=NO \
    -DINSTALL_QML_PREFIX=lib/qt6/qml

  cmake --build build
}

package() {
  install -Dm644 "quickshell-check.hook" -t "$pkgdir/usr/share/libalpm/hooks"

  cd $pkgname
  DESTDIR=$pkgdir cmake --install build
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
