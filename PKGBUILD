# Maintainer: Mees Luten <mees [dot] luten [at] gmail [dot] com>
pkgname=l-band-decoders-git
pkgver=r99.a5b6b00
pkgrel=1
pkgdesc="Small experimental project aimed at decoding various (HRPT) satellites such as Metop and FengYun"
arch=('x86_64')
url="https://github.com/altillimity/L-Band-Decoders"
license=('GPLv3')
depends=()
makedepends=('libcorrect-git' 'libpng' 'zlib' 'tclap' 'libccsds-git>=r9.bfa393e' 'libfec-git' 'git')
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
	# echo 'add_subdirectory("MetOp IASI Decoder")' >> "$pkgname"/CMakeLists.txt
}

build() {
	cd "$pkgname"/build
	cmake ../
	make -i
}

package() {
	cd "$pkgname"/build
	install -Dm755 CADU\ RSynchroderand/CADU-RSynchroderand "${pkgdir}"/usr/bin/CADU-RSynchroderand
	install -Dm755 FengYun\ Decoder/FengYun-Decoder "${pkgdir}"/usr/bin/FengYun-Decoder
	install -Dm755 FengYun\ VIRR\ Decoder/FengYun-VIRR-Decoder "${pkgdir}"/usr/bin/FengYun-VIRR-Decoder
	install -Dm755 METEOR\ BIS-M\ Decoder/METEOR-BIS-M-Decoder "${pkgdir}"/usr/bin/METEOR-BIS-M-Decoder
	install -Dm755 METEOR\ Demuxer/METEOR-Demux "${pkgdir}"/usr/bin/METEOR-Demux
	install -Dm755 METEOR\ MSU-MR\ Decoder/METEOR-MSU-MR-Decoder "${pkgdir}"/usr/bin/METEOR-MSU-MR-Decoder
	install -Dm755 METEOR\ MTVZA\ Decoder/METEOR-MTVZA-Decoder "${pkgdir}"/usr/bin/METEOR-MTVZA-Decoder
	install -Dm755 MetOp\ AVHRR\ Decoder/MetOp-AVHRR-Decoder "${pkgdir}"/usr/bin/MetOp-AVHRR-Decoder
	install -Dm755 MetOp\ Decoder/MetOp-Decoder "${pkgdir}"/usr/bin/MetOp-Decoder
	install -Dm755 NOAA\ MHS\ Decoder/MHS_Decoder "${pkgdir}"/usr/bin/MHS_Decoder
	install -Dm755 NOAA\ AVHRR\ Decoder/NOAA-AVHRR-Decoder "${pkgdir}"/usr/bin/NOAA-AVHRR-Decoder
	#install -Dm755 MetOp\ IASI\ Decoder/MetOp-IASI-Decoder "${pkgdir}"/usr/bin/MetOp-IASI-Decoder
}

