# Maintainer: livev2 <co@livev2.com>
# Contributor: arliweng <arliweng@outlook.com>

pkgname=v2mixer-bin
pkgver=1.20221209
pkgrel=1
pkgdesc='v2mixer, the movie editor, video mixer'
arch=('x86_64' 'aarch64' 'armv7h' 'ppc64le')
license=('custom')
url="http://v2mixer.livev2.com/"
makedepends=('zip')
depends=('jre8-openjdk' 'ffmpeg')

source_x86_64=("https://v2mixer.livev2.com/f/cms/10/v2mixer-linux-x86_64.tgz"
	'v2mixer.desktop')
sha256sums_x86_64=('SKIP'
	'0b4469724aa3dc23a90fab47cea181292df97573f72a6238a360ba646f9a090c')

source_aarch64=("https://v2mixer.livev2.com/f/cms/10/v2mixer-linux-arm64.tgz"
	'v2mixer.desktop')
sha256sums_aarch64=('SKIP'
	'0b4469724aa3dc23a90fab47cea181292df97573f72a6238a360ba646f9a090c')

source_armv7h=("https://v2mixer.livev2.com/f/cms/10/v2mixer-linux-arm32.tgz"
	'v2mixer.desktop')
sha256sums_armv7h=('SKIP'
	'0b4469724aa3dc23a90fab47cea181292df97573f72a6238a360ba646f9a090c')

source_ppc64le=("https://v2mixer.livev2.com/f/cms/10/v2mixer-linux-ppc64le.tgz"
	'v2mixer.desktop')
sha256sums_ppc64le=('SKIP'
	'0b4469724aa3dc23a90fab47cea181292df97573f72a6238a360ba646f9a090c')

build() {
	rm -fr v2mixer/bin/jre
	zip -d v2mixer/bin/com.livev2.v2mixer_lib/ffmpeg-linux-*.jar \
		/org/bytedeco/ffmpeg/*/libav* \
		/org/bytedeco/ffmpeg/*/libsw*
}

package() {
	mkdir -p ${pkgdir}/usr/share/livev2.com
	cp -rL v2mixer ${pkgdir}/usr/share/livev2.com
	mkdir -p ${pkgdir}/usr/bin
	ln -sr ${pkgdir}/usr/share/livev2.com/v2mixer/v2mixer.sh ${pkgdir}/usr/bin/
	install -D -m644 v2mixer.desktop ${pkgdir}/usr/share/applications/v2mixer.desktop
}
