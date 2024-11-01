# Maintainer: Caspar Friedrich <c.s.w.friedrich@gmail.com>

# Note: `makepkg --printsrcinfo > .SRCINFO`

pkgname="python-west"
_name=${pkgname##"python-"}
pkgdesc="Zephyr RTOS Project meta-tool"
pkgver=1.3.0
pkgrel=1
arch=("any")
url="https://pypi.org/project/west/"
license=("Apache")
depends=("python>=3.6"
         "python-colorama"
         "python-yaml>=5.1"
         "python-pykwalify"
         "python-packaging")
makedepends=("python-build"
             "python-installer"
             "python-wheel")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}

sha256sums=("89320034be87099d16e75f4760ac0d1ed67e8978928e468ab993e3fba0cfe92f")
