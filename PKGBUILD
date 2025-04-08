# Maintainer:  <xavierbaez at gmail dot com>
# Contributor: Patrik Sundberg <patrik.sundberg at gmail dot com>

pkgname=motivewave
pkgver=6.9.12
pkgrel=1
pkgdesc="Advanced trading and charting application."
arch=('x86_64')
url="https://www.motivewave.com"
license=('custom')
depends=('bc' 'ffmpeg' 'gtk2' 'gtk3' 'java-runtime' 'xorg-xrandr')
_build_id=524
source=("${pkgname}-${pkgver}.deb::https://downloads.motivewave.com/builds/${_build_id}/motivewave_${pkgver}_amd64.deb")
sha512sums=('028b72a30526a1a6181b887e3bd7458b65506c382db7f8251a5b043520147849849147533945a3ae6dd42c9a5c6c19f61e91e68d78c42cde2deb557383b50a15')

package() {
    bsdtar -xf data.tar.xz --no-same-owner -C "$pkgdir/"

    chmod -R g-w "$pkgdir/usr"
    chown -R root:root "$pkgdir"
    mkdir -pv "$pkgdir/usr/bin"
    ln -sv "/usr/share/motivewave/run.sh" "$pkgdir/usr/bin/motivewave"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgdir/usr/share/$pkgname/license.html"
}
