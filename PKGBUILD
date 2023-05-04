# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

pkgname='mollyguardctl'
pkgver=1.3.10
pkgrel=1
pkgdesc='Guards your system from accidental reboots and shutdowns'
arch=('any')
url="https://github.com/coNQP/${pkgname}"
license=('GPLv3')
depends=('python' 'python-setuptools')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
source=("git+${url}.git#tag=${pkgver}")
md5sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -dm 755 "${pkgdir}/usr/lib/systemd/system"

    for UNIT in *.service; do
        install -m 644 "${UNIT}" "${pkgdir}/usr/lib/systemd/system/"
    done
}
