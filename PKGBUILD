# Contributor: Patrik Sundberg <patrik.sundberg at gmail dot com>
# Contributor: Xavier Baez <xavierbaez at gmail dot com>

pkgname=motivewave
pkgver=6.6.3
pkgrel=1
pkgdesc="Advanced trading and charting application."
arch=('x86_64')
url="https://www.motivewave.com"
license=('custom')
depends=('bc' 'ffmpeg' 'gtk2' 'gtk3' 'java-runtime' 'xorg-xrandr')
source=("${pkgname}-${pkgver}.deb::https://www.motivewave.com/update/download.do?file_type=LINUX")
sha512sums=('C12304702C55EB0684FA2F8318CE593AD2288767AA7472771C00AAB0ABA9882B38D901C7CE712BF4D1868587D5B6A8D513A05E03699DB8358E2AE4DF0970C13F')

package() {
	bsdtar -xf data.tar.xz -C "$pkgdir/"
	find "$pkgdir" -exec chmod g-w {} +
	chown -R root.root "$pkgdir"
	mkdir -pv "$pkgdir/usr/bin"
	ln -sv "/usr/share/motivewave/run.sh" "$pkgdir/usr/bin/motivewave"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgdir/usr/share/$pkgname/license.html"
}
