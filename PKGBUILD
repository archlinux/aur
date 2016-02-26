# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=backblaze-b2
pkgver=0.4.0
pkgrel=1
pkgdesc="Backblaze B2 Command Line Client"
url="https://www.backblaze.com/b2/cloud-storage.html"
depends=('python2')
optdepends=()
# MIT or Creative Commons: https://www.backblaze.com/using_b2_code.html
license=('MIT')
arch=('any')

# Need a better source URL at some point
source=("https://github.com/Backblaze/B2_Command_Line_Tool/archive/v${pkgver}.tar.gz")
sha512sums=('9ac9f9f48f42aaa203e394ba8d40fa6e8dd98fbe09a457121d73b603e930e4ff0001c77bded03bd77cf2e4e713796ac2a00a74c5944b12c17433b6dfaea803b4')

build() {
    cd ${srcdir}/B2_Command_Line_Tool-${pkgver}
    python2 setup.py build
}

package() {
    cd ${srcdir}/B2_Command_Line_Tool-${pkgver}
    python2 setup.py build
    python2 setup.py install --root="$pkgdir" --optimize=1

    # https://wiki.archlinux.org/index.php/Python_package_guidelines
    rm -rf ${pkgdir}/usr/lib/python*/site-packages/tests/

    # Installed to backblaze-b2 because the Boost pkg installs /usr/bin/b2
    mv ${pkgdir}/usr/bin/b2 ${pkgdir}/usr/bin/backblaze-b2
}

