# Maintainer:  <xavierbaez at gmail dot com>
# Contributor: Patrik Sundberg <patrik.sundberg at gmail dot com>

pkgname=motivewave
pkgver=6.9.2
pkgrel=1
pkgdesc="Advanced trading and charting application."
arch=('x86_64')
url="https://www.motivewave.com"
license=('custom')
depends=('bc' 'ffmpeg' 'gtk2' 'gtk3' 'java-runtime' 'xorg-xrandr')
_build_id=514
source=("${pkgname}-${pkgver}.deb::https://downloads.motivewave.com/builds/${_build_id}/motivewave_${pkgver}_amd64.deb")
sha512sums=('eaf541e25ed01facaef34830163d2504e95ab18c5a18acb52c5d28cb9b64f1456dada3678507701fdd0e1742eb055b94c0096bfa6a2328083f1c6d9f6c504175')

package() {
    bsdtar -xf data.tar.xz --no-same-owner -C "$pkgdir/"

    chmod -R g-w "$pkgdir/usr"
    chown -R root:root "$pkgdir"
    mkdir -pv "$pkgdir/usr/bin"
    ln -sv "/usr/share/motivewave/run.sh" "$pkgdir/usr/bin/motivewave"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgdir/usr/share/$pkgname/license.html"
}
