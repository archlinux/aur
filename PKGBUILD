# Maintainer: erik-pro <aarnaarn2@gmail.com>
# Contributor: Steve Holmes <steve.holmes88@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=orca-git
pkgver=r8737+ga8748b197
pkgrel=1
pkgdesc="Screen reader for individuals who are blind or visually impaired (development version)"
arch=(any)
license=('LGPL')
url="https://gitlab.gnome.org/GNOME/orca.git"
source=(${pkgname}::'git+https://gitlab.gnome.org/GNOME/orca.git')
install=orca-git.install
options=('!libtool')
depends=('gtk3'
	'at-spi2-atk'
	'python-atspi' # -git
	'python-dbus'
	'python-xdg'
	'speech-dispatcher'
	'liblouis'
	'brltty'
	'xorg-xmodmap'
	'hicolor-icon-theme'
	'gsettings-desktop-schemas')
makedepends=('git'
	'gnome-common'
	'pkgconfig'
	'itstool'
	'intltool'
	'gnome-doc-utils'
	'yelp-tools')
provides=('orca')
conflicts=('orca')
md5sums=('SKIP')

pkgver() {
	cd ${pkgname}
	echo r$(git rev-list --count HEAD)+g$(git rev-parse --short HEAD)
}

build() {
	cd "${srcdir}/${pkgname}"
	PYTHON=/usr/bin/python ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var
	make
}

package() {
	cd "${srcdir}/${pkgname}"
	make DESTDIR="${pkgdir}" install
}
