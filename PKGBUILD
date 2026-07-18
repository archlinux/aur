# Maintainer: gryffyn <aur@evan.mp>
# Contributor: Helio Loureiro <helio@loureiro.eng.br>

pkgname=python-pytelegrambotapi
_pkgname=pyTelegramBotAPI
pkgver=4.36.0
pkgrel=1
pkgdesc="Python Telegram bot api"
arch=('any')
url="https://github.com/eternnoir/pyTelegramBotAPI"
license=("GPLv2")
depends=('python' 'python-requests' 'python-pytest' 'python-wheel' 'python-aiohttp' 'python-pip' 'python-build' 'sed' 'coreutils')
source=("https://github.com/eternnoir/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('1ba358b9eaf8c6a98bdaf9cb94eba1adb142e7ebcd5142f9117464dfe99d0426')

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}/
    py_pkg_path=$(python -c 'import sys; [print(p) for p in sys.path]' | sed -n '/^\/usr.*site-packages/p' | head -1)
    python -m build
    mkdir -p ${pkgdir}/${py_pkg_path}
    python -m pip install --no-deps \
        --target=${pkgdir}/${py_pkg_path} \
        dist/pytelegrambotapi-${pkgver}-py3-none-any.whl
}
