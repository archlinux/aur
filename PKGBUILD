# Maintainer: Antheas Kapenekakis <aur at antheas dot dev>
pkgname=gpdconfig-git
_repo=pyWinControls
pkgver=r30.ce2f1b2
pkgrel=1
pkgdesc="Configuration tool for GPD Win devices."
arch=('x86_64')
url='https://github.com/pelrun/pyWinControls.git'
license=('GPL3')
depends=('python' 'python-setuptools')
makedepends=('python-'{'build','installer','setuptools','wheel'})
source=("git+$url")
sha512sums=('SKIP')

build() {
    cd "${srcdir}/${_repo}"
    python -m build --wheel --no-isolation
}

pkgver() {
    cd "${srcdir}/${_repo}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_repo}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    mkdir -p ${pkgdir}/usr/lib/udev/rules.d/
    install -m644 99-kb-hid.rules ${pkgdir}/usr/lib/udev/rules.d/99-kb-hid.rules
}
