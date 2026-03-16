# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=snip
pkgname=${_appname}-tui
pkgver=0.6.0
pkgrel=1
pkgdesc="A terminal snippet manager to store, search, and copy code snippets without leaving your shell"

license=('MIT')
arch=('any')

url="https://github.com/phlx0/snip"

provides=("${_appname}")
depends=('python' 'python-pyperclip' 'python-rich' 'python-textual' 'python-pygments')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-pip')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('8c696b02f1745d27cfdff4e0b934f64564c59c5a298accdab4b563bf3c2fcd6b')


package() {
    cd "${srcdir}/${_appname}-${pkgver}/"

    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-warn-script-location --root-user-action ignore --no-deps .

    python -O -m compileall "${pkgdir}"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
