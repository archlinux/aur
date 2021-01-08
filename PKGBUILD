# Maintainer: alex19EP <aarnaarn2@gmail.com>
# Contributor: Steve Holmes <steve.holmes88@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=orca-git
pkgver=3.37.90.r106.gfd15dd414
pkgrel=1
pkgdesc="Screen reader for individuals who are blind or visually impaired (development version)"
arch=('any')
license=('LGPL')
url="https://wiki.gnome.org/Projects/Orca"
depends=('gtk3' 'at-spi2-atk' 'python-atspi' 'python-dbus' 'python-xdg'
         'speech-dispatcher' 'liblouis' 'brltty' 'xorg-xmodmap' 'gst-plugins-base'
         'gst-plugins-good')
makedepends=('git' 'yelp-tools' 'itstool' 'intltool')
provides=('orca')
conflicts=('orca')
source=(${pkgname%-git}::'git+https://gitlab.gnome.org/GNOME/orca.git')
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname%-git}"
	# cutting off 'ORCA_' prefix that presents in the git tag
	git describe --long | sed 's/^ORCA_//;s/\([^-]*-g\)/r\1/;s/_/-/g;s/-/./g'
}

prepare() {
	cd "${srcdir}/${pkgname%-git}"
	./autogen.sh
}

build() {
	cd "${srcdir}/${pkgname%-git}"
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
	make
}

package() {
	cd "${srcdir}/${pkgname%-git}"
	make DESTDIR="${pkgdir}" install
}
