# Contributor: Xavier Baez <xavierbaez at gmail dot com>
# Contributor: Patrik Sundberg <patrik.sundberg at gmail dot com>

pkgname=motivewave
pkgver=6.6.12
pkgrel=1
pkgdesc="Advanced trading and charting application."
arch=('x86_64')
url="https://www.motivewave.com"
license=('custom')
depends=('bc' 'ffmpeg' 'gtk2' 'gtk3' 'java-runtime' 'xorg-xrandr')
source=("${pkgname}-${pkgver}.deb::https://www.motivewave.com/update/download.do?file_type=LINUX")
sha512sums=('e0cbe2926492ca0ee3101b7832eacb253b803d1e7c777f422da4022c205bd536d3a3ec4f4c943d6644523fce5282b6c83cf730a28be201edb5d7605cb12688e6')

package() {
	bsdtar -xf data.tar.zst -C "$pkgdir/"
	find "$pkgdir" -exec chmod g-w {} +
	chown -cR root:root "$pkgdir"
	mkdir -pv "$pkgdir/usr/bin"
	ln -sv "/usr/share/motivewave/run.sh" "$pkgdir/usr/bin/motivewave"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgdir/usr/share/$pkgname/license.html"
}
