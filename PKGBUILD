# Maintainer:  Brett Dutro <brett.dutro@gmail.com>
# Contributor: dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Brett Dutro <brett.dutro@gmail.com>

pkgname=gstfs-ng
pkgver=1.1.1
pkgrel=1
pkgdesc="A FUSE-based file system for dynamic gstreamer-based transcoding"
arch=('x86_64')
url="https://github.com/rtyle/gstfs-ng"
license=('LGPL-3.0-or-later' 'LGPL-2.0-or-later') # According to `COPYING`: "If the Library as you received it does not specify a version number of the GNU Lesser General Public License, you may choose any version of the GNU Lesser General Public License ever published by the Free Software Foundation.". And I found no such specification.
depends=('fuse' 'boost-libs' 'gstreamer')
makedepends=('boost')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rtyle/gstfs-ng/archive/$pkgver.tar.gz")
sha256sums=('413ed75b91307a6480449f627f6f4057390391a5aa05b5d69f6326b80789b017')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    install -D gstfs-ng.8 "${pkgdir}"/usr/share/man/man8/gstfs-ng.8
    install -D gstfs-ng.monitor "${pkgdir}"/usr/bin/gstfs-ng.monitor
    install -D gstfs-ng "${pkgdir}"/usr/bin/gstfs-ng
    ln -s /usr/bin/gstfs-ng "${pkgdir}"/usr/bin/mount.gstfs-ng

    install -D -t "${pkgdir}/usr/share/doc/gstfs-ng"         README
    install -D -t "${pkgdir}/usr/share/licenses/${pkgname}"  COPYING
}
