# Contributor: Xavier Baez <xavierbaez at gmail dot com>
# Contributor: Patrik Sundberg <patrik.sundberg at gmail dot com>

pkgname=motivewave
pkgver=6.6.14
pkgrel=1
pkgdesc="Advanced trading and charting application."
arch=('x86_64')
url="https://www.motivewave.com"
license=('custom')
depends=('bc' 'ffmpeg' 'gtk2' 'gtk3' 'java-runtime' 'xorg-xrandr')
source=("${pkgname}-${pkgver}.deb::https://www.motivewave.com/update/download.do?file_type=LINUX")
sha512sums=('e629c6045bb271ee781cbf91f83200439dd59b644b86d6947b49ad2c7f39a48be94f5f19dad96c8f86827c5e4d8044afc5f09d084dcd4f413ea9380b29ec5a42')

package() {
	bsdtar -xf data.tar.xz -C "$pkgdir/"
	find "$pkgdir" -exec chmod g-w {} +
	chown -R root:root "$pkgdir"
	mkdir -pv "$pkgdir/usr/bin"
	ln -sv "/usr/share/motivewave/run.sh" "$pkgdir/usr/bin/motivewave"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgdir/usr/share/$pkgname/license.html"
}
