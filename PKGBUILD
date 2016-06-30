# Maintainer: Justin Wong <justin.w.xd at gmail dot com>
# Co-Maintainer: Peter Cai <peter at typeblog dot net>
_distro="ubuntu16.04"

pkgname=netease-cloud-music
pkgver=1.0.0
pkgrel=1
pkgdesc="Netease Cloud Music, converted from .deb package"
arch=("x86_64")
url="http://music.163.com/"
license=('custom')
depends=(
	"alsa-lib" "gtk2" "nss" "libxss"
	"qt5-multimedia" "qt5-x11extras"
	"gst-libav" "gst-plugins-base"
	"gst-plugins-good" "gst-plugins-ugly" 
)
source=(
	"http://s1.music.126.net/download/pc/${pkgname}_${pkgver/_/-}_amd64_${_distro}.deb"
	"http://archive.ubuntu.com/ubuntu/pool/universe/libc/libcue/libcue1_1.4.0-1_amd64.deb"
	"http://music.163.com/html/web2/service.html"
	"netease-cloud-music"
)
noextract=(
	"libcue1_1.4.0-1_amd64.deb"
)
md5sums=('c1430b695eff22294ab3b84205105cdf'
         '51920df6edb60d9ef5e4e9f3ae3be0d6'
         '2f06d90c7b3362a01c287ec7b6a40f27'
         '31a25ac517facc48762a6a9378a66f58')

prepare() {
	(mkdir -p libcue && cd libcue && ar xf ../libcue1_1.4.0-1_amd64.deb && tar xf data.tar.gz)
}

package() {
  cd ${srcdir}
  tar -xvf data.tar.xz -C ${pkgdir}
  chmod +x ${pkgdir}/usr/lib/netease-cloud-music/libcef.so
  install -D -m644 service.html ${pkgdir}/usr/share/licenses/$pkgname/license.html
  install -m755 libcue/usr/lib/libcue.so.1.0.4 ${pkgdir}/usr/lib/netease-cloud-music/libcue.so.1
  install -m755 netease-cloud-music ${pkgdir}/usr/bin/netease-cloud-music
}
