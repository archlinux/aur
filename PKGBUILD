# Contributor: Xavier Baez <xavierbaez at gmail dot com>
# Contributor: Patrik Sundberg <patrik.sundberg at gmail dot com>

pkgname=motivewave
pkgver=6.6.9
pkgrel=1
pkgdesc="Advanced trading and charting application."
arch=('x86_64')
url="https://www.motivewave.com"
license=('custom')
depends=('bc' 'ffmpeg' 'gtk2' 'gtk3' 'java-runtime' 'xorg-xrandr')
source=("${pkgname}-${pkgver}.deb::https://www.motivewave.com/update/download.do?file_type=LINUX")
sha512sums=('15a79751ca7d1e76dca7ba68bd25a6b340b3bef72455e9058b13009b2ed05585b290e0fd26cb4d8790d0b6a44d84c641823cf839320df1b8872525cc6c8d31ef')

package() {
	bsdtar -xf data.tar.xz -C "$pkgdir/"
	find "$pkgdir" -exec chmod g-w {} +
	chown -R root.root "$pkgdir"
	mkdir -pv "$pkgdir/usr/bin"
	ln -sv "/usr/share/motivewave/run.sh" "$pkgdir/usr/bin/motivewave"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgdir/usr/share/$pkgname/license.html"
}
