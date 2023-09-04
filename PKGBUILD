# Maintainer:  <xavierbaez at gmail dot com>
# Contributor: Patrik Sundberg <patrik.sundberg at gmail dot com>

pkgname=motivewave
pkgname_duplicate=motivewave-latest-bin
pkgver=6.7.10
pkgrel=8
pkgdesc="Advanced trading and charting application."
arch=('x86_64')
url="https://www.motivewave.com"
license=('custom')
depends=('bc' 'ffmpeg' 'gtk2' 'gtk3' 'java-runtime' 'xorg-xrandr')
_build_id=500
source=("${pkgname}-${pkgver}.deb::https://downloads.motivewave.com/builds/${_build_id}/motivewave_${pkgver}_amd64.deb")
sha512sums=('c97e3bb78236d6ef1ae8581e29b128e6ee512f8241617dbcab5989f3068bfa6bbe9b9c091bb09b238ea891f59e6c12ef13ceee079610f3fc95722c58c4769bb9')
provides=("$pkgname")
conflicts=("$pkgname_duplicate")

package() {
    bsdtar -xf data.tar.xz -C "$pkgdir/"

    find "$pkgdir" -exec chmod g-w {} +
    chown -R root:root "$pkgdir"
    mkdir -pv "$pkgdir/usr/bin"
    ln -sv "/usr/share/motivewave/run.sh" "$pkgdir/usr/bin/motivewave"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgdir/usr/share/$pkgname/license.html"
}
