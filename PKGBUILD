pkgname=captioner-git
pkgver=v1.1.0.r5.ge1a52bf
pkgrel=1
pkgdesc="GUI program to caption/manip images using plain text or markdown."
arch=('x86_64')
url='https://github.com/Matthieu-LAURENT39/captioner'
license=('GPL')

depends=("python>=3.11" "pyside6" "python-pillow")
makedepends=(python-build python-installer python-wheel)
optdepends=()

provides=(captioner)
conflicts=(captioner)

source=("$pkgname::git+https://github.com/Matthieu-LAURENT39/captioner.git#branch=main")
sha1sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 packaging/captioner.desktop "$pkgdir"/usr/share/applications/captioner.desktop
}
