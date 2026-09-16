pkgname='linuxtoys-bin'
pkgver='7.1.5'
pkgrel=1
arch=('x86_64')
depends=(bash git curl wget zenity python python-gobject python-requests gtk3 vte3)
makedepends=()
conflicts=(linuxtoys)
provides=("linuxtoys=$pkgver")
source=("https://github.com/psygreg/linuxtoys/releases/download/${pkgver}/linuxtoys-${pkgver}.tar.xz")
sha256sums=('62d5c64248ba70e90049d2eacf1cf04338da71f46aa6a5b79efb9f308367d0d3')

package() {
    mkdir -p ${pkgdir}/usr
    cp -rf ${srcdir}/linuxtoys-${pkgver}/usr/* ${pkgdir}/usr/
    find "${pkgdir}/usr/share/linuxtoys" -type d -name '__pycache__' -prune -exec rm -rf {} +
    find "${pkgdir}/usr/share/linuxtoys" -type f \( -name '*.pyc' -o -name '*.pyo' \) -delete
    
    # Set proper permissions for executable files
    chmod +x "${pkgdir}/usr/bin/linuxtoys"
    chmod +x "${pkgdir}/usr/share/linuxtoys/linuxtoys.py"
    find "${pkgdir}/usr/share/linuxtoys/scripts/" -name "*.sh" -exec chmod +x {} \;
}
