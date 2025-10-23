# Maintainer : Michael Herstine <sp1ff at pobox dot com>
pkgname=mpdpopm-bin
pkgver=0.3.5
pkgrel=1
pkgdesc='Maintain ratings & playcounts for your mpd server (pre-compiled)'
url=https://github.com/sp1ff/mpdpopm
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=("gcc-libs" "glibc")
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("https://github.com/sp1ff/mpdpopm/releases/download/$pkgver/mpdpopm-$pkgver-x86_64-unknown-linux.tar.gz")
sha256sums=('163aa1fc4ee1921592aaeff29a81f6bcdaaad245a40e8141021b36ca9e0c9d1e')

package() {
    _output="${srcdir}/${pkgname/-bin/}-$pkgver-x86_64-unknown-linux"
    install -Dm755 "${_output}/bin/mppopm" "${pkgdir}/usr/bin/mppopm"
    install -Dm755 "${_output}/bin/mppopmd" "${pkgdir}/usr/bin/mppopmd"

    install -Dm644 "${_output}/doc/mppopmd.conf" "${pkgdir}/etc/mppopmd.conf"
    gzip "${_output}/doc/mpdpopm.info"
    install -Dm644 "${_output}/doc/mpdpopm.info.gz" "${pkgdir}/usr/share/info/mpdpopm.info.gz"
    install -Dm644 "${_output}/doc/mppopmd.service" "${pkgdir}/usr/lib/systemd/user/mppopmd.service"
    sudo install-info --info-dir=${pkgdir}/usr/share/info ${pkgdir}/usr/share/info/mpdpopm.info.gz
}

