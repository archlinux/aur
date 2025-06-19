# Maintainer: Tamir Zahavi-Brunner <tamir.z3@gmail.com>

pkgname=qkdisplays
pkgver=1.0
pkgrel=1
pkgdesc="A helper tool for quickly configuring a multi-monitor setup"
url="https://github.com/tamirzb/qkdisplays"
arch=('any')
license=("GPL-3.0-or-later")
depends=('python' 'python-gobject' 'gtk3' 'gtk-layer-shell' 'python-i3ipc')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('cfc7774302aa2a36b5ae82b862ed86bdab9d76f6c830bf96e47bc6881c321cfa')

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm 644 qkdisplays.1 "${pkgdir}/usr/share/man/man1/qkdisplays.1"
}

