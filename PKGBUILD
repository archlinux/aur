# Contributor: Patrik Sundberg <patrik.sundberg at gmail dot com>
# Contributor: Xavier Baez <xavierbaez at gmail dot com>

pkgname=motivewave
pkgver=6.6.0
pkgrel=1
pkgdesc="Advanced trading and charting application."
arch=('x86_64')
url="https://www.motivewave.com"
license=('custom')
depends=('bc' 'ffmpeg' 'gtk2' 'gtk3' 'java-runtime' 'xorg-xrandr')
source=("${pkgname}-${pkgver}.deb::https://www.motivewave.com/update/download.do?file_type=LINUX")
sha512sums=('45F1F6BB9D525FE03A54B24593EC287A1DA2B058B6ECCAC57DECB03DD9A0F5AE61B44A12B662C0E3AA712EB6E711BF1795285F98F911F965BA2FEB10C75A6825')

package() {
	bsdtar -xf data.tar.xz -C "$pkgdir/"
	find "$pkgdir" -exec chmod g-w {} +
	chown -R root.root "$pkgdir"
	mkdir -pv "$pkgdir/usr/bin"
	ln -sv "/usr/share/motivewave/run.sh" "$pkgdir/usr/bin/motivewave"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgdir/usr/share/$pkgname/license.html"
}
