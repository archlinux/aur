## Maintainer: pyamsoft <pyam.soft@gmail.com>

pkgname=steam-wrapper
# shellcheck disable=SC2034
pkgdesc="Steam wrapper for common operations"
# shellcheck disable=SC2034
pkgver=0.6.0
# shellcheck disable=SC2034
pkgrel=1
# shellcheck disable=SC2034
arch=('i686' 'x86_64')
# shellcheck disable=SC2034
optdepends=('steam-native: Native runtime library support' \
        'steam-libs: Native steam libraries support')
# shellcheck disable=SC2034
depends=('steam' 'bash' 'coreutils' 'findutils')
# shellcheck disable=SC2034
makedepends=()
# shellcheck disable=SC2034
provides=('steam-wrapper')
# shellcheck disable=SC2034
conflicts=('steam-wrapper')
# shellcheck disable=SC2034
license=('GPLv2')
# shellcheck disable=SC2034
url="https://github.com/pyamsoft/${pkgname}"
# shellcheck disable=SC2034
source=("$url/archive/${pkgver}.tar.gz")
# shellcheck disable=SC2034
sha256sums=('9d77cd58a5458a8391965934d6dde232f80fe4dca06818ee4337752331bc2c57')

package() {
  # shellcheck disable=SC2154
  cd "$srcdir/$pkgname-$pkgver" || {
	msg "Could not cd into ${srcdir}/${pkgname}-${pkgver}"
	return 1
  }

  # Install the script
  # shellcheck disable=SC2154
  install -Dm 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # Install the desktop file
  install -Dm644 "${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install the default configuration
  install -Dm 644 "${pkgname}.conf" \
    "${pkgdir}/etc/${pkgname}/${pkgname}.conf"
}

