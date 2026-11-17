# Original Maintainer: bko <aur at bil dot co dot ua>
# Maintainer: higorslva <higor.slva at outlook dot com>

pkgname=pgadmin4-desktop-bin
pkgver=9.19
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
  "pgadmin4-desktop-${pkgver}-x86_64.deb::https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/trixie/dists/pgadmin4/main/binary-amd64/pgadmin4-desktop_${pkgver}-1.trixie_amd64.deb"
)

sha256sums=(
  'd7d55841743067bc6a97f84ce622cb1f236cd35d7a3f4954bdf18b1763b0d46f'
)

prepare() {
  msg2 "Extracting the debian package..."
  mkdir -p "${srcdir}/deb-content"

  bsdtar -xf "pgadmin4-desktop-${pkgver}-x86_64.deb" -C "${srcdir}"
  bsdtar -xf "${srcdir}"/data.tar.* -C "${srcdir}/deb-content"
}

package() {
  msg2 "Installing files into the package..."
  cp -r "${srcdir}/deb-content/usr" "${pkgdir}/"
  if [[ -d "${srcdir}/deb-content/etc" ]]; then
    cp -r "${srcdir}/deb-content/etc" "${pkgdir}/"
  fi
}