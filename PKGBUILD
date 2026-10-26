# Maintainer: MeoArch <https://github.com/QwQdoge>
_srcdir=MeoArch-os-workspace-bff7e70558c525ee055284a78511f61657c67188
pkgname=meo-repair
pkgver=0.1.0
pkgrel=2
pkgdesc="Meo Repair diagnostics and consent-gated system repair for MeoArch"
arch=('x86_64')
url='https://github.com/QwQdoge/MeoArch-os-workspace'
license=('GPL-3.0-or-later')
depends=('meoui-qml>=1.0.4beta1' 'meo-kde-runtime>=0.4.0beta3' 'qt6-base' 'qt6-declarative' 'qtkeychain-qt6' 'polkit-qt6')
makedepends=('cmake' 'ninja' 'qt6-tools')
options=('!debug')
source=('MeoArch-os-workspace-bff7e70558c525ee055284a78511f61657c67188.tar.gz::https://codeload.github.com/QwQdoge/MeoArch-os-workspace/tar.gz/bff7e70558c525ee055284a78511f61657c67188')
sha256sums=('c41c5e0dee2e69b98f0032f832a68c564169505eaabd74543df29035070e696c')

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
