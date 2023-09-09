# Maintainer:  <xavierbaez at gmail dot com>
# Contributor: Patrik Sundberg <patrik.sundberg at gmail dot com>

pkgname=motivewave
pkgver=6.7.11
pkgrel=1
pkgdesc="Advanced trading and charting application."
arch=('x86_64')
url="https://www.motivewave.com"
license=('custom')
depends=('bc' 'ffmpeg' 'gtk2' 'gtk3' 'java-runtime' 'xorg-xrandr')
_build_id=501
source=("${pkgname}-${pkgver}.deb::https://downloads.motivewave.com/builds/${_build_id}/motivewave_${pkgver}_amd64.deb")
sha512sums=('d9710ddbedfe485fcf37e909f36d66761079d8664172e2f3c394a64bc88de7dbc1d75d9a708f5f402e7da5969ba276ff30431e193fdc03ac4f089e626a84ea9f')

package() {
    bsdtar -xf data.tar.xz --no-same-owner -C "$pkgdir/"

    chmod -R g-w "$pkgdir/usr"
    chown -R root:root "$pkgdir"
    mkdir -pv "$pkgdir/usr/bin"
    ln -sv "/usr/share/motivewave/run.sh" "$pkgdir/usr/bin/motivewave"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgdir/usr/share/$pkgname/license.html"
}
