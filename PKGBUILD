# Maintainer: Carmine Margiotta <car.margiotta@icloud.com>
pkgname='mqtt-sm-git'
pkgver=r103.b35ef81
pkgrel=1
pkgdesc="MQTT System Monitor, compatible with Home Assistant"
arch=('any')
url="https://github.com/cmargiotta/MQTT-System-Monitor"
license=('GPL')
groups=()

depends=(
	'paho-mqtt-c'
	'openssl'
	'lua'
)
makedepends=(
	'git'
	'meson'
	'ninja'
)
checkdepends=()
optdepends=()
provides=(
	'msm'
)
conflicts=(
	'msm'
)
replaces=()
backup=(
	etc/msm/sensors/*
	usr/lib/systemd/system/msm.service
)
options=()
install=
changelog=
source=("$pkgname::git+https://github.com/cmargiotta/MQTT-System-Monitor")
noextract=()
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	echo "r$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
	meson --prefix /usr "$pkgname" build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
