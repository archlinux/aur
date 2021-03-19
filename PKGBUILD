#Maintainer: Dylan Delgado <dylan1496@live.com>

pkgname=browservice
pkgver=0.9.2.0
pkgrel=2
pkgdesc='Browse the modern web on historical browsers'
url='https://github.com/ttalvitie/browservice'
license=('MIT')
arch=('x86_64' 'armv7l' 'aarch64')
depends=('wget' 'cmake' 'poco' 'pango' 'libjpeg-turbo' 'libxcb' 'libx11' 'python' 'xorg-server-xvfb' 'xorg-xauth' 'at-spi2-atk' 'alsa-lib' 'nss' 'libcups' 'libxcursor' 'libxss' 'libxcomposite' 'libxkbcommon' 'ttf-ms-fonts' 'gtkglext')
source=("https://github.com/ttalvitie/browservice/archive/v${pkgver}.tar.gz"
'cmake.patch')
sha256sums=('cd253de3f8254f05d83b2ea0e65ec047a3b05ab5c0903644501a383756ed2047'
'9a89293e55961adadca26829e2a97f06286b19b554032917cccbf1bd0bd53700')

prepare() {
cd "${srcdir}/${pkgname}-${pkgver}"
patch --strip=1 < ../cmake.patch
}

build() {
cd "${srcdir}/${pkgname}-${pkgver}"
./download_cef.sh
./setup_cef.sh
make -j${nproc}
}

package() {
cd "${srcdir}/${pkgname}-${pkgver}"
install -Dm755 release/bin/chrome-sandbox "${pkgdir}/usr/bin/chrome-sandbox"
install -Dm755 release/bin/browservice "${pkgdir}/usr/bin/browservice"
install -Dm755 cef/Release/libcef.so "${pkgdir}/usr/lib/libcef.so"
install -Dm755 release/bin/icudtl.dat "${pkgdir}/usr/lib/icudtl.dat"
install -Dm755 release/bin/cef.pak "${pkgdir}/usr/lib/cef.pak"
install -Dm755 release/bin/cef_100_percent.pak "${pkgdir}/usr/lib/cef_100_percent.pak"
install -Dm755 release/bin/cef_200_percent.pak "${pkgdir}/usr/lib/cef_200_percent.pak"
install -Dm755 release/bin/cef_extensions.pak "${pkgdir}/usr/lib/cef_extensions.pak"
install -Dm755 release/bin/retrojsvice.so "${pkgdir}/usr/lib/retrojsvice.so"
}