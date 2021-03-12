# Maintainer: Alexander Bruegmann <mail[at]abruegmann[dot]eu>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Alexander Fehr <pizzapunk gmail com>

_pkgname=filezilla
pkgname=${_pkgname}-unstable
pkgver=3.53.0_rc1
pkgrel=1
pkgdesc='Fast and reliable FTP, FTPS and SFTP client. (includes unstable versions)'
url='https://filezilla-project.org/'
arch=('x86_64')
license=('GPL')
depends=('dbus' 'xdg-utils' 'wxgtk3' 'libidn' 'hicolor-icon-theme' 'sqlite'
	     'gnutls' 'libfilezilla-unstable>=0.27.0')
provides=('filezilla')
conflicts=('filezilla')
source=("https://download.filezilla-project.org/client/FileZilla_${pkgver//_/-}_src.tar.bz2")
sha512sums=('2c7e1bf239c302032cf23426bcf0e726bbc63e0563a56b92b8647e1f40fbf758e5ddbc32c449a8a71ccddfc07e5e0e576fc33d8822d9280751e8db413aeefc09')

build() {
  cd ${_pkgname}-${pkgver//_/-}
  ./configure \
    --prefix=/usr \
    --disable-manualupdatecheck \
    --disable-autoupdatecheck \
    --with-pugixml=builtin \
    --with-wx-config=/usr/bin/wx-config-gtk3
  make -j8
}

package() {
  cd ${_pkgname}-${pkgver//_/-}
  make DESTDIR="${pkgdir}" install
}
