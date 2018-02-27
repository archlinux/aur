# $Id$
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Maintainer: Shai Jo <shaiJo4U[äT]protonmail(.)com

_pkgname=filezilla
pkgname=$_pkgname-storj
pkgver=3.31.0
pkgrel=1
pkgdesc="Fast and reliable Storj, FTP, FTPS and SFTP client"
arch=('x86_64')
url="http://filezilla-project.org/"
license=('GPL')
depends=('dbus' 'xdg-utils' 'wxgtk3' 'libidn' 'hicolor-icon-theme' 'sqlite' 'gnutls' 'libfilezilla' 'libstorj')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("http://downloads.sourceforge.net/project/filezilla/FileZilla_Client/${pkgver}/FileZilla_${pkgver}_src.tar.bz2")

prepare() {
  cd "${_pkgname}-${pkgver}"
}

build() {
  cd "${_pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --disable-manualupdatecheck \
    --disable-autoupdatecheck \
    --with-pugixml=builtin \
    --with-wx-config=/usr/bin/wx-config-gtk3 \
    --enable-storj
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

md5sums=('0eee1369904e9b0b60500a1068ca5a85')
