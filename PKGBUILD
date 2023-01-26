# Contributor: Xavier Baez <xavierbaez at gmail dot com>
# Contributor: Patrik Sundberg <patrik.sundberg at gmail dot com>

pkgname=motivewave
pkgver=6.6.13
pkgrel=1
pkgdesc="Advanced trading and charting application."
arch=('x86_64')
url="https://www.motivewave.com"
license=('custom')
depends=('bc' 'ffmpeg' 'gtk2' 'gtk3' 'java-runtime' 'xorg-xrandr')
source=("${pkgname}-${pkgver}.deb::https://www.motivewave.com/update/download.do?file_type=LINUX")
sha512sums=('84FD9BE0D737406E3D23ED67EDC47CD4D5759C493F2C0054D069053714E2E085E4B222E7FCD305804DFF9B1E1A3A9DA1388BC74278D431AA0276716A79C20B53')

package() {
	bsdtar -xf data.tar.zst -C "$pkgdir/"
	find "$pkgdir" -exec chmod g-w {} +
	chown -R root:root "$pkgdir"
	mkdir -pv "$pkgdir/usr/bin"
	ln -sv "/usr/share/motivewave/run.sh" "$pkgdir/usr/bin/motivewave"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgdir/usr/share/$pkgname/license.html"
}
