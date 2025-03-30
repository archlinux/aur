# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-elm327-emulator
_name=${pkgname#python-}
pkgver=3.0.4
pkgrel=1
epoch=
pkgdesc="ELM327 Emulator for testing software interfacing OBDII via ELM327 adapter."
arch=('any')
url="https://pypi.org/project/${_name}"
license=('CC-BY-NC-SA-4.0')
groups=()
provides=(${_name} ${pkgname})
conflicts=(${_name} ${pkgname})
depends=(
    python
    python-lockfile
    python-yaml
    # AUR
    python-daemon
    python-obd
)
makedepends=(
    python-build
    python-installer
    python-wheel
    python-setuptools
)
options=('!strip' '!debug')
_name=${_name//-/_}
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
# source=("${_name}-${pkgver}.tar.gz::${url}/archive/refs/tags/$pkgver.tar.gz")
noextract=()
sha256sums=('927fead0b3323015d2f5f627c469cf616d92bbeda4a28f6006ab1648b80ad2d8')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    #     install -dm 644 "$pkgdir/usr/share/doc/$pkgname/"
    #     cp -r documentation/*.md "$pkgdir/usr/share/doc/$pkgname/"
}
