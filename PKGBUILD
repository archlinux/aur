# Maintainer: Mees Luten <mees [dot] luten [at] gmail [dot] com>
pkgname=x-band-decoders-git
pkgver=r102.1d23d24
pkgrel=1
pkgdesc="A project aimed at decoding various X-Band satellites"
arch=('x86_64')
url="https://github.com/altillimity/X-Band-Decoders"
license=('GPLv3')
depends=()
makedepends=('libaec' 'libfec-git' 'libcorrect-git' 'git' 'libccsds-git')
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
	install -Dm755 ATMS\ Decoder/ATMS-Decoder "${pkgdir}"/usr/bin/ATMS-Decoder
	install -Dm755 Aqua\ Decoder/AQUA-Decoder "${pkgdir}"/usr/bin/AQUA-Decoder
	install -Dm755 Aqua\ MODIS\ Extractor/AQUA-MODIS-Extractor "${pkgdir}"/usr/bin/AQUA-MODIS-Extractor
	install -Dm755 CADU\ Synchroderand/CADU-Synchroderand "${pkgdir}"/usr/bin/CADU-Synchroderand
	install -Dm755 CERES\ Decoder/CERES-Decoder "${pkgdir}"/usr/bin/CERES-Decoder
	install -Dm755 ELEKTRO-L\ Decoder/ELEKTRO-L-Decoder "${pkgdir}"/usr/bin/ELEKTRO-L-Decoder
	install -Dm755 FengYun\ 3D\ Decoder/FengYun-3D-Decoder "${pkgdir}"/usr/bin/FengYun-3D-Decoder
	install -Dm755 FengYun\ MPT\ Decoder/FengYun-MPT-Decoder "${pkgdir}"/usr/bin/FengYun-MPT-Decoder
	install -Dm755 FengYun\ MERSI-2\ Decoder/FengYun-MERSI-2-Decoder "${pkgdir}"/usr/bin/FengYun-MERSI-2-Decoder
	install -Dm755 FengYun\ MERSI-1\ Decoder/FengYun-MERSI-1-Decoder "${pkgdir}"/usr/bin/FengYun-MERSI-1-Decoder
	install -Dm755 MODIS\ Decoder/MODIS-Decoder "${pkgdir}"/usr/bin/MODIS-Decoder
	install -Dm755 HRD\ Decoder/HRD-Decoder "${pkgdir}"/usr/bin/HRD-Decoder
	install -Dm755 Terra\ Decoder/TERRA-Decoder "${pkgdir}"/usr/bin/TERRA-Decoder
	install -Dm755 VIIRS\ Decoder/VIIRS-Decoder "${pkgdir}"/usr/bin/VIIRS-Decoder
}
