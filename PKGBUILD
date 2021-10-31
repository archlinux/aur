# Maintainer: Sematre <sematre at gmx dot de>
pkgname=videosubfinder
pkgver=5.60
pkgrel=1

pkgdesc="Audio/Video processing software with focus on new generation HD formats, Blu-ray and HD DVD."
arch=('x86_64')
url="https://sourceforge.net/projects/videosubfinder/"
license=('GPL2')
depends=('wine' 'winetricks')
source=("${pkgname}-${pkgver}.zip::https://netcologne.dl.sourceforge.net/project/videosubfinder/VideoSubFinder_${pkgver}_x64.zip"
        "start-videosubfinder.sh")
sha256sums=('7b503df4397acd5fe05f57e64d5ae84e3849f2f9f3575555df4b74077dd4db6e'
            '6c043e16d468fc9c226d077aedac0ffaf6d378b6a4d731ceff2153dad898c904')

package() {
	cd "${srcdir}"

	# Install the start script
	install -Dm755 "start-videosubfinder.sh" "${pkgdir}/usr/bin/videosubfinder"
	ln -s "videosubfinder" "${pkgdir}/usr/bin/VideoSubFinderWXW"

	# Go to the project folder
	cd "${srcdir}/Release_x64"

	# Install the Windows executable
	install -Dm755 "VideoSubFinderWXW.exe" -t "${pkgdir}/usr/share/${pkgname}"

	# Install the DLLs
	find . -name '*.dll' -exec install -Dm644 "{}" -t "${pkgdir}/usr/share/${pkgname}" \;

	# Install the assets
	find . -name '*.wav' -exec install -Dm644 "{}" -t "${pkgdir}/usr/share/${pkgname}" \;
	cp -r bitmaps/ "${pkgdir}/usr/share/${pkgname}/"
	cp -r settings/ "${pkgdir}/usr/share/${pkgname}/"
}
