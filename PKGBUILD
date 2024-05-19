# Maintainer: gryffyn <aur@evan.mp>
# Contributor: Helio Loureiro <helio@loureiro.eng.br>

pkgname=python-pytelegrambotapi
_pkgname=pyTelegramBotAPI
pkgver=4.18.0
pkgrel=1
pkgdesc="Python Telegram bot api"
arch=('any')
url="https://github.com/eternnoir/pyTelegramBotAPI"
license=("GPLv2")
depends=('python' 'python-requests' 'python-pytest' 'python-wheel' 'python-aiohttp' 'python-pip' 'python-build' 'sed' 'coreutils')
source=("https://github.com/eternnoir/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e6fccec896928bb957d24634fb11b18c63dc660c6564337800beb7e8b067d33f')

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}/
    py_pkg_path=$(python -c 'import sys; [print(p) for p in sys.path]' | sed -n '/^\/usr.*site-packages/p' | head -1)
    python -m build
    mkdir -p ${pkgdir}/${py_pkg_path}
    python -m pip install --no-deps \
        --target=${pkgdir}/${py_pkg_path} \
        dist/pytelegrambotapi-${pkgver}-py3-none-any.whl
}
