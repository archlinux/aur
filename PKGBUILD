pkgname='linuxtoys-bin'
pkgver='7.2.9'
pkgrel=1
arch=('x86_64')
depends=(bash git curl wget zenity appstream archlinux-appstream-data python python-gobject python-requests gtk3 vte3 sudo util-linux)
makedepends=(rust cargo maturin python)
conflicts=(linuxtoys)
provides=("linuxtoys=$pkgver")
source=("https://github.com/psygreg/linuxtoys/releases/download/${pkgver}/linuxtoys-${pkgver}.tar.xz")
sha256sums=('3acef7fbe7db5a7a00cb883cdfe81b611831e611e355e6e2736b6dbb9c6d4d4b')

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
