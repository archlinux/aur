# Maintainer: Vaishnav-Sabari-Girish <vaishnav.sabari.girish@gmail.com>

pkgname=comchan-bin
_pkgname=comchan
pkgver=0.14.0
pkgrel=1
pkgdesc="A blazingly fast minimal serial monitor with plotter TUI and more"
arch=('x86_64' 'aarch64')
url="https://github.com/Vaishnav-Sabari-Girish/ComChan"
license=('MIT')

# Same runtime dependencies as the source package
depends=('gcc-libs' 'libudev.so' 'fontconfig' 'dbus')

# Ensure pacman knows this replaces the source-built version
provides=("$_pkgname")
conflicts=("$_pkgname")

# Architecture-specific source files renamed locally to include the version
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${url}/releases/download/v${pkgver}/${_pkgname}-aarch64-unknown-linux-gnu.tar.xz")

# SHA256sum
sha256sums_x86_64=('6152732c52b1636c1d2c80f429eca010828198a618b5e978d5ba677ad0f81446')
sha256sums_aarch64=('541c20fda5e94bdaa8f184e1257a4c5fa50e0f89b7ead620d1cb29d2b38b5238')

package() {
  # cargo-dist extracts into a directory named after the target tuple
  _target="${CARCH}-unknown-linux-gnu"
  cd "${srcdir}/${_pkgname}-${_target}"

  install -Dm 755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
