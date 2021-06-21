# Contributor: evaggelos balaskas <evaggelos . balaskas . gr>
# Maintainer:  evaggelos balaskas <evaggelos . balaskas . gr>

pkgname=ssh-import-id
pkgver=5.11
pkgrel=1
pkgdesc="Import SSH public keys from Launchpad or other URLs"
url="https://launchpad.net/ssh-import-id"

arch=('x86_64')
license=('GPL3')

makedepends=('git' 'python' 'python-setuptools')
depends=('python-distro')

source=("${pkgname}::git+https://git.launchpad.net/ssh-import-id?signed#tag=${pkgver}")
validpgpkeys=('D98F377EB47CC6DD257A9A07E564B9C275BDD52E') # Robie Basak

sha256sums=('SKIP')

pkgver() {
    cd ${pkgname}
    git describe --tags
}

build() {
    cd ${pkgname}
    python setup.py build
}

package() {
    cd ${pkgname}
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1

    install -Dm644 usr/share/man/man1/ssh-import-id.1 "${pkgdir}/usr/share/man/man1/ssh-import-id.1"
    install -Dm644 etc/ssh/ssh_import_id "${pkgdir}/etc/ssh/ssh_import_id"
}

# vim: tabstop=4 expandtab shiftwidth=4 softtabstop=4

