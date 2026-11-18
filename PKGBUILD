# Maintainer: MeoArch <https://github.com/QwQdoge>
_srcdir=MeoArch-os-workspace-fafe86ff3521586fc5ca2a2e28da24194a205de7
pkgname=meo-repair
pkgver=0.1.0
pkgrel=3
pkgdesc="Meo Repair diagnostics and consent-gated system repair for MeoArch"
arch=('x86_64')
url='https://github.com/QwQdoge/MeoArch-os-workspace'
license=('GPL-3.0-or-later')
depends=('meoui-qml>=1.0.4beta1' 'meo-kde-runtime>=0.4.0beta3' 'qt6-base' 'qt6-declarative' 'qtkeychain-qt6' 'polkit-qt6')
makedepends=('cmake' 'ninja' 'qt6-tools')
options=('!debug')
source=('MeoArch-os-workspace-fafe86ff3521586fc5ca2a2e28da24194a205de7.tar.gz::https://codeload.github.com/QwQdoge/MeoArch-os-workspace/tar.gz/fafe86ff3521586fc5ca2a2e28da24194a205de7')
sha256sums=('a3310c8a0b90074735bc9e5c632c6daf10abdb0d88b364591595cdb5bca43da2')

# The release renderer stages the pinned MeoArch workspace at $srcdir/$_srcdir.
# Repair is deliberately built from that source train so its shared
# installer/repair controller cannot drift from the installed recovery stack.
build() {
  cmake -S "$srcdir/$_srcdir/repair" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc
  cmake --build build --parallel
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$srcdir/$_srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
