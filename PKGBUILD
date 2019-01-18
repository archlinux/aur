# Maintainer: erik-pro <aarnaarn2@gmail.com>
# Contributor: Steve Holmes <steve.holmes88@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=orca-git
pkgver=3_31_4.r2.g95154f3a9
pkgrel=1
pkgdesc="Screen reader for individuals who are blind or visually impaired (development version)"
arch=(any)
license=('LGPL')
url="https://wiki.gnome.org/Projects/Orca"
depends=('gtk3'
	'at-spi2-atk'
	'python-atspi'
	'python-dbus'
	'python-xdg'
	'speech-dispatcher'
	'liblouis'
	'brltty'
	'xorg-xmodmap'
	'gsettings-desktop-schemas'
	'gst-plugins-base'
	'gst-plugins-good')
makedepends=('git'
	'itstool'
	'intltool'
	'yelp-tools')
provides=('orca')
conflicts=('orca')
source=(${pkgname}::'git+https://gitlab.gnome.org/GNOME/orca.git')
md5sums=('SKIP')

pkgver() {
	cd ${pkgname}
	# cutting off 'ORCA_' prefix that presents in the git tag	
	printf "%s" "$(git describe --long | sed 's/^ORCA_//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
	cd "${srcdir}/${pkgname}"
	./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var
	make
}

package() {
	cd "${srcdir}/${pkgname}"
	make DESTDIR="${pkgdir}" install
}
