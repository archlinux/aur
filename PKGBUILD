pkgname='linuxtoys-bin'
pkgver='5.0.16'
pkgrel=1
arch=('x86_64')
depends=(bash git curl wget zenity python python-gobject gtk3 jq)
makedepends=()
conflicts=(linuxtoys)
provides=("linuxtoys=$pkgver")
install=linuxtoys.install
source=("https://github.com/psygreg/linuxtoys/releases/download/${pkgver}/linuxtoys-${pkgver}.tar.xz")
sha256sums=('d7704dd388b4f03c9c0c65877a337e355bfaa068d00a725cb515b3847ce48fa7')

package() {
    mkdir -p ${pkgdir}/usr
    cp -rf ${srcdir}/linuxtoys-${pkgver}/usr/* ${pkgdir}/usr/
    
    # Set proper permissions for executable files
    chmod +x "${pkgdir}/usr/bin/linuxtoys"
    chmod +x "${pkgdir}/usr/share/linuxtoys/run.py"
    find "${pkgdir}/usr/share/linuxtoys/scripts/" -name "*.sh" -exec chmod +x {} \;
    find "${pkgdir}/usr/share/linuxtoys/helpers/" -name "*.sh" -exec chmod +x {} \;
}
