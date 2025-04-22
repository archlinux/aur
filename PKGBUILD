# Maintainer: livev2 <co@livev2.com>
# Contributor: arliweng <arliweng@outlook.com>

pkgname=v2mixer-bin
pkgver=1.20250419
pkgrel=2
pkgdesc='v2mixer, the movie editor, video mixer'
arch=('x86_64' 'aarch64')
license=('custom')
url="http://v2mixer.livev2.com/"
depends=('jre8-openjdk')
#makedepends=('zip')
#depends=('jre8-openjdk' 'ffmpeg')

source_x86_64=('http://v2mixer.livev2.com/f/cms/10/v2mixer-linux-x86_64.tgz'
	'http://v2mixer.livev2.com/f/cms/10/sha256.txt'
	'http://v2mixer.livev2.com/f/cms/10/md5.txt'
	'v2mixer.desktop')
sha256sums_x86_64=('SKIP' 'SKIP' 'SKIP'
	'7e441f0cb26feddebad5622bfafd8271bd6db00ca64035339cbc40cdbde2de78')

source_aarch64=('http://v2mixer.livev2.com/f/cms/10/v2mixer-linux-arm64.tgz'
	'http://v2mixer.livev2.com/f/cms/10/sha256.txt'
	'http://v2mixer.livev2.com/f/cms/10/md5.txt'
	'v2mixer.desktop')
sha256sums_aarch64=('SKIP' 'SKIP' 'SKIP'
	'7e441f0cb26feddebad5622bfafd8271bd6db00ca64035339cbc40cdbde2de78')

prepare() {
	if [ $CARCH == 'aarch64' ]; then
		grep v2mixer-linux-arm64.tgz sha256.txt | sha256sum -c || exit 1
		grep v2mixer-linux-arm64.tgz md5.txt | md5sum -c || exit 1
	else
		grep v2mixer-linux-${CARCH}.tgz sha256.txt | sha256sum -c || exit 1
		grep v2mixer-linux-${CARCH}.tgz md5.txt | md5sum -c || exit 1
	fi
}

build() {
	rm -fr v2mixer/bin/jre
# uncomment for FFmpeg native, including GPL license, but only same version of v2mixer
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
