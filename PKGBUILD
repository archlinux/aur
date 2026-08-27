# Maintainer: Vaishnav-Sabari-Girish <vaishnav.sabari.girish@gmail.com>

pkgname=comchan-bin
_pkgname=comchan
pkgver=0.15.0
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
sha256sums_x86_64=('6a95ecad54c6e8e6f208794184ac2985781653f1a3b6f9c8f32bf9cfa9272771')
sha256sums_aarch64=('8ae6b457605bd24dd14961279cec3f38799f9c813b93ccb02af913764df2ddb6')

package() {
  # cargo-dist extracts into a directory named after the target tuple
  _target="${CARCH}-unknown-linux-gnu"
  cd "${srcdir}/${_pkgname}-${_target}"

  install -Dm 755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
