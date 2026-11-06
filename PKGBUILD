# Maintainer: H3mul <phil.d324@gmail.com>
pkgname=mutate-mvr-git
pkgver=0.1.0.r4.ge9edf0c
pkgrel=1
pkgdesc="Merge, isolate, delete and clean up MVR files"
arch=('any')
url="https://github.com/H3mul/mutate-mvr"
license=('MIT')
depends=('python' 'python-lxml')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
# smoke-test: mutate-mvr --help
provides=('mutate-mvr')
conflicts=('mutate-mvr')
options=('!debug')
source=("git+https://github.com/H3mul/mutate-mvr.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/mutate-mvr"
    printf "%s.r%s.g%s" \
        "$(grep -m1 '^version' pyproject.toml | sed 's/version = "\(.*\)"/\1/')" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/mutate-mvr"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/mutate-mvr"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
