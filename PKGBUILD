# Maintainer: Leonardo Berbert <leo4berbert@gmail.com>

pkgname=zashterm
pkgver=0.1.0
pkgrel=1
pkgdesc="A modern GTK4/Adwaita terminal emulator with advanced session management, SSH integration, and security features."
arch=('any')
url="https://github.com/leoberbert/zashterm"
license=('GPL3')
depends=(
    'gtk4' 'libadwaita' 'libsecret' 'python' 'python-cairo' 'python-py7zr'
    'python-gobject' 'python-setproctitle' 'python-requests' 'python-psutil'
    'sshpass' 'rsync' 'vte4' 'gobject-introspection' 'python-regex' 'python-pygments'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'uv')
conflicts=('zash')
provides=('zash' 'zashterm')
replaces=('zash')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}"
    uv build --wheel
}
package() {
    cd "${srcdir}/${pkgname}"
    
    python -m installer --destdir="$pkgdir" dist/*.whl

    if [ -d "usr/share" ]; then
        mkdir -p "$pkgdir/usr"
        cp -ra usr/share "$pkgdir/usr/"
    fi

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
