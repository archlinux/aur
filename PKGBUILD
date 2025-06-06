# Maintainer: Thomas Weißschuh <aur t-8ch de>

pkgname=mpdris2
pkgver=0.9.1
pkgrel=2
pkgdesc="MPRIS2 support for MPD"
url="https://github.com/eonpatapon/mpDris2"
arch=(any)
license=(GPL-3.0-only)
depends=('python-dbus' 'python-gobject' 'python-mpd2' 'python-systemd')
makedepends=('intltool')
optdepends=(
  'python-mutagen: read covers from music files'
  'libnotify: notifications on track change'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/eonpatapon/mpDris2/archive/${pkgver}.tar.gz"
	798b410a286879801ecebbf165273c4105ed07c9.patch)
sha256sums=('d0f0467841e7866310cff44a1063334a9c776a64fd594815d926670b765fbee6'
            '36feedf56cda2d064e379512df717fc1a4a0104e05f7913140cd9ad1acd3fff0')

prepare() {
	cd "${srcdir}/mpDris2-${pkgver}"

	patch -p1 < "${srcdir}/798b410a286879801ecebbf165273c4105ed07c9.patch"
}

build() {
	cd "${srcdir}/mpDris2-${pkgver}"

	./autogen.sh --prefix=/usr --sysconfdir=/etc
	make
}

package() {
	cd "${srcdir}/mpDris2-${pkgver}"

	make DESTDIR="$pkgdir" install
}
