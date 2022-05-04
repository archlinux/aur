# Contributor: Patrik Sundberg <patrik.sundberg at gmail dot com>
# Contributor: Xavier Baez <xavierbaez at gmail dot com>

pkgname=motivewave
pkgver=6.6.4
pkgrel=1
pkgdesc="Advanced trading and charting application."
arch=('x86_64')
url="https://www.motivewave.com"
license=('custom')
depends=('bc' 'ffmpeg' 'gtk2' 'gtk3' 'java-runtime' 'xorg-xrandr')
source=("${pkgname}-${pkgver}.deb::https://www.motivewave.com/update/download.do?file_type=LINUX")
sha512sums=('ed90747900adb1a6fa245deb4b2747443fa53a0d05e261f8cc0b72b268d3fc79a93face4023dbc5f1717418fdd7a33efcd940d8a608192b8d78228c189cbe031')

package() {
	bsdtar -xf data.tar.xz -C "$pkgdir/"
	find "$pkgdir" -exec chmod g-w {} +
	chown -R root.root "$pkgdir"
	mkdir -pv "$pkgdir/usr/bin"
	ln -sv "/usr/share/motivewave/run.sh" "$pkgdir/usr/bin/motivewave"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgdir/usr/share/$pkgname/license.html"
}
