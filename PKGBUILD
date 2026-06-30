# Maintainer: Vaishnav-Sabari-Girish <vaishnav.sabari.girish@gmail.com>

pkgname=comchan-bin
_pkgname=comchan
pkgver=0.13.0
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
sha256sums_x86_64=('4ef18597496f61bdee88d874340f94e546944622a19186f5b076f5b830fc81c6')
sha256sums_aarch64=('aecccc0c817dfa8d7eedf31ab89fa27cc1ea22d76a3c094ac75951c7cfd02d16')

package() {
  # cargo-dist extracts into a directory named after the target tuple
  _target="${CARCH}-unknown-linux-gnu"
  cd "${srcdir}/${_pkgname}-${_target}"

  install -Dm 755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
