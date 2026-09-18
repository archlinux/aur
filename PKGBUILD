# Original Maintainer: bko <aur at bil dot co dot ua>
# Maintainer: higorslva <higor.slva at outlook dot com>

pkgname=pgadmin4-desktop-bin
pkgver=9.18
pkgrel=1
pkgdesc='The desktop user interface for pgAdmin (binary from Ubuntu). pgAdmin is the most popular administration platform for PostgreSQL.'
arch=('x86_64')
url='https://www.pgadmin.org/'
license=('PostgreSQL')
makedepends=('libarchive' 'tar' 'zstd')
depends=("pgadmin4-server" 'xdg-utils' 'python-dbus')
provides=('pgadmin4-desktop')
conflicts=('pgadmin4-desktop')

source=(
  "pgadmin4-desktop-${pkgver}-x86_64.deb::https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/noble/dists/pgadmin4/main/binary-amd64/pgadmin4-desktop_9.18-1.noble_amd64.deb"
)

sha256sums=(
  'aad3e46f433ad5d05d0966df1a9b76a9f9047a42d5afb547fcb9db1dc4e190db'
)

prepare() {
  msg2 "Extracting the debian package..."
  mkdir -p "${srcdir}/deb-content"

  bsdtar -xf "pgadmin4-desktop-${pkgver}-x86_64.deb" -C "${srcdir}"
  tar -x --zstd -f "${srcdir}/data.tar.zst" -C "${srcdir}/deb-content"
}

package() {
  msg2 "Installing files into the package..."
  cp -r "${srcdir}/deb-content/usr" "${pkgdir}/"
  cp -r "${srcdir}/deb-content/etc" "${pkgdir}/"
}