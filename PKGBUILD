# Maintainer: Vaishnav-Sabari-Girish <vaishnav.sabari.girish@gmail.com>

pkgname=comchan-bin
_pkgname=comchan
pkgver=0.10.1
pkgrel=1
pkgdesc="A blazingly fast minimal serial monitor with plotter TUI and more"
arch=('x86_64' 'aarch64')
url="https://github.com/Vaishnav-Sabari-Girish/ComChan"
license=('MIT')

# Same runtime dependencies as the source package
depends=('gcc-libs' 'libudev.so' 'fontconfig')

# Ensure pacman knows this replaces the source-built version
provides=("$_pkgname")
conflicts=("$_pkgname")

# Architecture-specific source files renamed locally to include the version
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${url}/releases/download/v${pkgver}/${_pkgname}-aarch64-unknown-linux-gnu.tar.xz")

# Final verification checksums
sha256sums_x86_64=('827e57ce1076ee4a4c290def1e672140ed1c8116692cd91898296b0d37ee71f9')
sha256sums_aarch64=('b655b45583a3c39eae73519140d24b3473455537c365c0480042c6bb6897e36a')

package() {
  # cargo-dist extracts into a directory named after the target tuple
  _target="${CARCH}-unknown-linux-gnu"
  cd "${srcdir}/${_pkgname}-${_target}"

  install -Dm 755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
