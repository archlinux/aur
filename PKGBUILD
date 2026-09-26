pkgname='linuxtoys-bin'
pkgver='7.3'
pkgrel=1
arch=('x86_64')
depends=(bash git curl wget zenity appstream archlinux-appstream-data python python-gobject python-requests gtk3 vte3 sudo util-linux)
makedepends=(rust cargo maturin python pkgconf patchelf gtk3)
conflicts=(linuxtoys)
provides=("linuxtoys=$pkgver")
source=("https://github.com/psygreg/linuxtoys/releases/download/${pkgver}/linuxtoys-${pkgver}.tar.xz")
sha256sums=('091f1eda23574af3f315c937b53587ac9d11b4165a20a9d8e8046eeeeb2d8b11')

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
