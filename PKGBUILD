# Maintainer: Carmine Margiotta <car.margiotta@icloud.com>
pkgname='mqtt-system-monitor'
pkgver=0.0.1beta
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
source=("https://github.com/cmargiotta/$pkgname/archive/refs/tags/$pkgver.tar.gz")
noextract=()
sha256sums=('e380119cf121a1439cf903d6dd60a92811d5e63f6bfc15a59490919ddab13f1d')

build() {
	cd $srcdir/$pkgname-$pkgver
	pwd
	meson --prefix /usr build
	meson compile -C build
}

package() {
	cd $srcdir/$pkgname-$pkgver
	meson install -C build --destdir "$pkgdir"
}
