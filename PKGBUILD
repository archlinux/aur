# Maintainer:  <xavierbaez at gmail dot com>
# Contributor: Patrik Sundberg <patrik.sundberg at gmail dot com>

pkgname=motivewave
pkgver=6.8.3
pkgrel=1
pkgdesc="Advanced trading and charting application."
arch=('x86_64')
url="https://www.motivewave.com"
license=('custom')
depends=('bc' 'ffmpeg' 'gtk2' 'gtk3' 'java-runtime' 'xorg-xrandr')
_build_id=506
source=("${pkgname}-${pkgver}.deb::https://downloads.motivewave.com/builds/${_build_id}/motivewave_${pkgver}_amd64.deb")
sha512sums=('0136e2ad9d678dddec3dfd124338440848a88f6de5e8a07d3bb4685522c2f6ae42a8962852c3349c4cfcdc08ee500af307088031be766459381c8e9cd0df3f12')

package() {
    bsdtar -xf data.tar.xz --no-same-owner -C "$pkgdir/"

    chmod -R g-w "$pkgdir/usr"
    chown -R root:root "$pkgdir"
    mkdir -pv "$pkgdir/usr/bin"
    ln -sv "/usr/share/motivewave/run.sh" "$pkgdir/usr/bin/motivewave"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgdir/usr/share/$pkgname/license.html"
}
