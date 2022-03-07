# Contributor: Patrik Sundberg <patrik.sundberg at gmail dot com>
# Contributor: Xavier Baez <xavierbaez at gmail dot com>

pkgname=motivewave
pkgver=6.6.1
pkgrel=1
pkgdesc="Advanced trading and charting application."
arch=('x86_64')
url="https://www.motivewave.com"
license=('custom')
depends=('bc' 'ffmpeg' 'gtk2' 'gtk3' 'java-runtime' 'xorg-xrandr')
source=("${pkgname}-${pkgver}.deb::https://www.motivewave.com/update/download.do?file_type=LINUX")
sha512sums=('beb1f38807da953041625b9c777a9e1c6b030f23860f1ad6c61d0ff797b282daaebfdef3c08e3e739598b36381de86bffda13e3345ec51dc9299799c921b803a')

package() {
	bsdtar -xf data.tar.xz -C "$pkgdir/"
	find "$pkgdir" -exec chmod g-w {} +
	chown -R root.root "$pkgdir"
	mkdir -pv "$pkgdir/usr/bin"
	ln -sv "/usr/share/motivewave/run.sh" "$pkgdir/usr/bin/motivewave"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgdir/usr/share/$pkgname/license.html"
}
