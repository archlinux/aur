# Maintainer: Mees Luten <mees [dot] luten [at] gmail [dot] com>
pkgname=x-band-decoders-git
pkgver=r52.f8d2295
pkgrel=1
pkgdesc="A project aimed at decoding various X-Band satellites"
arch=('x86_64')
url="https://github.com/altillimity/X-Band-Decoders"
license=('GPLv3')
depends=(libaec)
makedepends=('libfec-git' 'libcorrect-git' 'git' 'libccsds-git')
provides=()
conflicts=()
replaces=()
source=("$pkgname"::'git+https://github.com/altillimity/X-Band-Decoders.git')
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
	install -Dm755 Aqua\ Decoder/AQUADecoder "${pkgdir}"/usr/bin/AQUADecoder
	install -Dm755 Aqua\ MODIS\ Extractor/AQUA-MODIS-Extractor "${pkgdir}"/usr/bin/AQUA-MODIS-Extractor
	install -Dm755 CADU\ Synchroderand/CADU-Synchroderand "${pkgdir}"/usr/bin/CADU-Synchroderand
	install -Dm755 ELEKTRO-L\ Decoder/ELEKTRO-L-Decoder "${pkgdir}"/usr/bin/ELEKTRO-L-Decoder
	install -Dm755 FengYun\ 3D\ Decoder/FY3DDecoder "${pkgdir}"/usr/bin/FY3DDecoder
	install -Dm755 FengYun\ MPT\ Decoder/FengYun-MPT-Decoder "${pkgdir}"/usr/bin/FengYun-MPT-Decoder
	install -Dm755 FengYun\ MERSI-2\ Decoder/FengYun-MERSI-2-Decoder "${pkgdir}"/usr/bin/FengYun-MERSI-2-Decoder
	install -Dm755 FengYun\ MERSI-1\ Decoder/FengYun-MERSI-1-Decoder "${pkgdir}"/usr/bin/FengYun-MERSI-1-Decoder
	install -Dm755 MODIS\ Decoder/MODIS-Decoder "${pkgdir}"/usr/bin/MODIS-Decoder
}
