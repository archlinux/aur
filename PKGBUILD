# Maintainer: Feresey <p.milko1999@yandex.ru>
# Contributor: Joost Cassee <joost@cassee.net>

pkgname=shellgpt-git
_pkgname=shell_gpt
pkgver=0.9.0.r0.ga054a90
pkgrel=1
pkgdesc="A command-line productivity tool powered by OpenAI's ChatGPT (GPT-3.5)"
arch=('any')
url="https://github.com/TheR1D/shell_gpt"
license=('MIT')
provides=("${pkgname}")
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-wheel'
)
depends=(
    'python-distro'
    'python-typer'
    'python-requests'
    'python-rich'
    'python-click'
)
source=("git+https://github.com/TheR1D/shell_gpt.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    
    python -m build .
}

package() {
    cd "${srcdir}/${_pkgname}"

    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

