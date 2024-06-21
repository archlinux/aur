# Maintainer: nafets227 <nafets227@users.noreply.github.com>
pkgname=vdr-softhddevice-drm
pkgver=r705.c1cd90c
pkgrel=2
_vdrapi=2.6.7
pkgdesc="VDR output plugin for software HD based on DRM interface"
#url="https://github.com/zillevdr/vdr-plugin-softhddevice-drm.git"
arch=('x86_64' 'aarch64')
license=('AGPL3')
depends=('ffmpeg-rpi' "vdr-api=${_vdrapi}" 'alsa-lib')
source=("${pkgname}::git+https://github.com/zillevdr/vdr-plugin-softhddevice-drm.git")
#source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/refs/tags/V${pkgver}.tar.gz"
#        "50-$_plugname.conf")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname}"
  PKG_CONFIG_PATH=/usr/lib/ffmpeg-rpi/pkgconfig make
}

package() {
  cd "$srcdir/${pkgname}"
  PKG_CONFIG_PATH=/usr/lib/ffmpeg-rpi/pkgconfig make DESTDIR="$pkgdir/" install
}
