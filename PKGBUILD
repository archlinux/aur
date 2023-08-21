pkgname=captioner
pkgver=1.1.1
pkgrel=1
pkgdesc="GUI program to caption/manip images using plain text or markdown."
arch=('x86_64')
url='https://github.com/Matthieu-LAURENT39/captioner'
license=('GPL')

depends=("python>=3.11" "pyside6" "python-pillow")
makedepends=(python-build python-installer python-wheel)
optdepends=()

source=("https://github.com/Matthieu-LAURENT39/captioner/archive/refs/tags/v${pkgver}.tar.gz")
sha1sums=('ea2919f1ca551c18f7edb735f5b10b776e40c288')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 packaging/captioner.desktop "$pkgdir"/usr/share/applications/captioner.desktop
}
