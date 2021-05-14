# Author: Hunter Wittenborn <hunter@hunterwittenborn.com>
# Maintainer: Hunter Wittenborn <hunter@hunterwittenborn.com>

pkgname=makedeb
pkgver=2.0.6
pkgrel=1
pkgdesc="Create Debian archives from PKGBUILDs (stable release)"
arch=('any')
depends=('pacman' 'dpkg')
license=('GPL3')
url="https://github.com/hwittenborn/makedeb"

source=("https://repo.hunterwittenborn.com/debian/makedeb/pool/m/makedeb/makedeb_${pkgver}-${pkgrel}_all.deb")
sha256sums=('SKIP')

package() {
  # Extract Debian package
  tar -xf "${srcdir}"/data.tar.xz -C "${pkgdir}/"

  ## All just patches until package is updated to alpha release
  sed -i "s|FUNCTIONS_DIR=.*|FUNCTIONS_DIR=/usr/lib/makedeb/|" "${pkgdir}"/usr/bin/makedeb
  sed -i "s|DATABASE_DIR=.*|DATABASE_DIR=/usr/lib/makedeb-db/|" "${pkgdir}"/usr/bin/makedeb

  # Disable auto install functionality as Arch doesn't use APT
  sed -i 's|${INSTALL}|INSTALL|' "${pkgdir}"/usr/bin/makedeb
  sed -i 's|INSTALL="TRUE".*|echo "APT is required for auto installation functionality, and has thus been disabled."; exit 1 ;;|' \
    "${pkgdir}"/usr/bin/makedeb
  sed -i 's|echo "  -I,.*"||' "${pkgdir}"/usr/bin/makedeb
  sed -i 's|echo "  Items.*||' "${pkgdir}"/usr/bin/makedeb
}
