# Maintainer: livev2 <co@livev2.com>
# Contributor: arliweng <arliweng@outlook.com>

pkgname=v2mixer-bin
pkgver=1.20250419
pkgrel=1
pkgdesc='v2mixer, the movie editor, video mixer'
arch=('x86_64' 'aarch64' 'armv7h' 'ppc64le')
license=('custom')
url="http://v2mixer.livev2.com/"
depends=('jre8-openjdk')
#makedepends=('zip')
#depends=('jre8-openjdk' 'ffmpeg')

source_x86_64=("http://v2mixer.livev2.com/f/cms/10/v2mixer-linux-x86_64.tgz"
	'v2mixer.desktop')
sha256sums_x86_64=('SKIP'
	'7e441f0cb26feddebad5622bfafd8271bd6db00ca64035339cbc40cdbde2de78')

source_aarch64=("http://v2mixer.livev2.com/f/cms/10/v2mixer-linux-arm64.tgz"
	'v2mixer.desktop')
sha256sums_aarch64=('SKIP'
	'7e441f0cb26feddebad5622bfafd8271bd6db00ca64035339cbc40cdbde2de78')

build() {
	rm -fr v2mixer/bin/jre
# comment for ffmpeg 5 only, native 6 unsupported
#	zip -d v2mixer/bin/com.livev2.v2mixer_lib/ffmpeg-linux-*.jar \
#		/org/bytedeco/ffmpeg/*/libav* \
#		/org/bytedeco/ffmpeg/*/libsw*
}

package() {
	mkdir -p ${pkgdir}/usr/share/livev2.com
	cp -rL v2mixer ${pkgdir}/usr/share/livev2.com
	mkdir -p ${pkgdir}/usr/bin
	ln -sr ${pkgdir}/usr/share/livev2.com/v2mixer/v2mixer.sh ${pkgdir}/usr/bin/v2mixer
	install -D -m644 v2mixer.desktop ${pkgdir}/usr/share/applications/v2mixer.desktop
}
