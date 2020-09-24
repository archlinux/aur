# Maintainer: Mees Luten <mees [dot] luten [at] gmail [dot] com>
pkgname=l-band-decoders-git
pkgver=r67.425f3a0
pkgrel=1
pkgdesc="Small experimental project aimed at decoding various (HRPT) satellites such as Metop and FengYun"
arch=('x86_64')
url="https://github.com/altillimity/L-Band-Decoders"
license=('GPLv3')
depends=()
makedepends=('libfec-git' 'git')
provides=()
conflicts=(satellite-decoders)
replaces=()
source=("$pkgname"::'git+https://github.com/altillimity/L-Band-Decoders.git')
sha256sums=("SKIP")

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

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
	install -Dm755 NOAA\ MHS\ Decoder/MHS_Decoder "${pkgdir}"/usr/bin/MHS_Decoder
	install -Dm755 QPSK\ Demodulator/QPSK-Demodulator "${pkgdir}"/usr/bin/QPSK-Demodulator
	install -Dm755 NOAA\ AVHRR\ Decoder/NOAA-AVHRR-Decoder "${pkgdir}"/usr/bin/NOAA-AVHRR-Decoder
}

