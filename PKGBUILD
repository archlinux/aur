# Maintainer: Dandraghas <dandraghas@gmail.com>

pkgname=python-global-capslock-git
_pkgname="${pkgname/-git/}"
_srcname="${_pkgname/python-/}"
pkgver=r34.db8cfde
pkgrel=1
pkgdesc="A CaPsLOCK KeY shaReD by thE WOrLD"
arch=('any')
url="https://globalcapslock.com/"
license=('MIT')
depends=('python' 'python-websockets')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("git+https://github.com/nolenroyalty/${_srcname}.git")
provides=("$_pkgname")
conflicts=("$_pkgname")
sha256sums=('SKIP')

pkgver() {
  cd "${_srcname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "${srcdir}/${_srcname}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_srcname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 README.md "${pkgdir}/usr/share/doc/$pkgname/README.md"
}

