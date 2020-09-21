# Maintainer: Mees Luten <mees [dot] luten [at] gmail [dot] com>
# This package is build from a non-release version, going to change soon.  
pkgname=satellite-decoders
pkgver=0.1
pkgrel=1
pkgdesc="Small experimental project aimed at decoding various satellites such as Metop and FengYun"
arch=('x86_64')
url="https://gitlab.altillimity.com/altillimity/satellite-decoders"
license=('GPLv3')
depends=()
makedepends=('libfec-git')
provides=()
conflicts=()
replaces=()
#source=("https://gitlab.altillimity.com/altillimity/satellite-decoders/-/archive/master/satellite-decoders-master.tar.gz")
#sha256sums=('1ead86b24beed186cb6e899eb32b7ac941b02a84fe4dc246156f36d27a782c2a')
source=("$pkgname"::'git+http://gitlab.altillimity.com/altillimity/satellite-decoders.git')
sha256sums=("SKIP")

prepare() {
	#rm -f -r $pkgname
	#mv $pkgname-master $pkgname
	mkdir -p "$pkgname"/build
}

build() {
	cd "$pkgname"/build
	cmake ../
	make
}

package() {
	cd "$pkgname"/build
	install -Dm755 CCSDS\ Demuxer/CCSDS-Demux "${pkgdir}"/usr/bin/CCSDS-Demux
	install -Dm755 FengYun\ Decoder/FengYun-Decoder "${pkgdir}"/usr/bin/FengYun-Decoder
	install -Dm755 FengYun\ VIRR\ Decoder/FengYun-VIRR-Decoder "${pkgdir}"/usr/bin/FengYun-VIRR-Decoder
	install -Dm755 METEOR\ BIS-M\ Decoder/METEOR-BIS-M-Decoder "${pkgdir}"/usr/bin/METEOR-BIS-M-Decoder
	install -Dm755 METEOR\ Demodulator/METEOR-Demodulator "${pkgdir}"/usr/bin/METEOR-Demodulator
	install -Dm755 METEOR\ Demuxer/METEOR-Demux "${pkgdir}"/usr/bin/METEOR-Demux
	install -Dm755 METEOR\ MSU-MR\ Decoder/METEOR-MSU-MR-Decoder "${pkgdir}"/usr/bin/METEOR-MSU-MR-Decoder
	install -Dm755 METEOR\ MTVZA\ Decoder/METEOR-MTVZA-Decoder "${pkgdir}"/usr/bin/METEOR-MTVZA-Decoder
	install -Dm755 MetOp\ AVHRR\ Decoder/MetOp-AVHRR-Decoder "${pkgdir}"/usr/bin/MetOp-AVHRR-Decoder
	install -Dm755 MetOp\ Decoder/MetOp-Decoder "${pkgdir}"/usr/bin/MetOp-Decoder
	install -Dm755 NOAA\ Demodulator/NOAA-Demodulator "${pkgdir}"/usr/bin/NOAA-Demodulator
	install -Dm755 QPSK\ Demodulator/QPSK-Demodulator "${pkgdir}"/usr/bin/QPSK-Demodulator
	#install -Dm755  "${pkgdir}"/usr/bin/
}
