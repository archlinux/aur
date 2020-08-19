# Maintainer: Jonas Malaco <jonas@protocubo.io>
# Contributor: laptander <dev-laptander a|t yandex d|o|t ru>
pkgname=ipwebcam-gst-git
pkgver=r118.e993f58
pkgrel=2
pkgdesc="Use Android smartphone as webcam and/or microphone"
arch=('any')
url="https://github.com/bluezio/ipwebcam-gst"
license=('GPL3')
depends=('android-tools'
	 'gst-plugins-good'
	 'gstreamer'
	 'pulseaudio'
	 'v4l-utils'
	 'v4l2loopback-dkms'
	 'zenity')
makedepends=('git')
optdepends=('pavucontrol: change playback/record devices')
provides=("${pkgname%-gst-git}")
conflicts=("${pkgname%-gst-git}")
source=("$pkgname::git+$url.git#branch=master")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 run-videochat.sh "$pkgdir/usr/bin/run-videochat"
}
