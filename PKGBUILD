pkgname='linuxtoys-bin'
pkgver='6.9'
pkgrel=1
arch=('x86_64')
depends=(bash git curl wget zenity python python-gobject python-requests gtk3 vte3)
makedepends=()
conflicts=(linuxtoys)
provides=("linuxtoys=$pkgver")
source=("https://github.com/psygreg/linuxtoys/releases/download/${pkgver}/linuxtoys-${pkgver}.tar.xz")
sha256sums=('d1ec85fac2c6295f0b6c6c3af36a8a9ad8107bd1320360d548c3af3497647f38')

package() {
    mkdir -p ${pkgdir}/usr
    cp -rf ${srcdir}/linuxtoys-${pkgver}/usr/* ${pkgdir}/usr/
    find "${pkgdir}/usr/share/linuxtoys" -type d -name '__pycache__' -prune -exec rm -rf {} +
    find "${pkgdir}/usr/share/linuxtoys" -type f \( -name '*.pyc' -o -name '*.pyo' \) -delete
    
    # Set proper permissions for executable files
    chmod +x "${pkgdir}/usr/bin/linuxtoys"
    chmod +x "${pkgdir}/usr/share/linuxtoys/linuxtoys.py"
    find "${pkgdir}/usr/share/linuxtoys/scripts/" -name "*.sh" -exec chmod +x {} \;
    find "${pkgdir}/usr/share/linuxtoys/helpers/" -name "*.sh" -exec chmod +x {} \;
}
