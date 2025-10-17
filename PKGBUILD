# Maintainer: mr-scrpt <mr.scrpt@gmail.com>
pkgname=pass-keyboard-control
pkgver=1.0.4
pkgrel=1
pkgdesc="AI-generated keyboard-driven GUI for Unix password manager (pass) with total keyboard control"
arch=('any')
url="https://github.com/mr-scrpt/pass-keyboard-control"
license=('MIT')
depends=(
    'python'
    'pyside6'
    'qt6-tools'
    'python-qtawesome'
    'python-qt-material'
    'pass'
    'gnupg'
)
optdepends=(
    'git: for synchronization with remote repositories'
    'xclip: for clipboard support'
    'wl-clipboard: for clipboard support on Wayland'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools-scm'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mr-scrpt/pass_app/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('07ab5aa736283edaa312077389922a1512d57dba8f0ac9d3f73f20024bc90d2a')

build() {
    cd "pass_app-${pkgver}"
    /usr/bin/python -m build --wheel --no-isolation
}

package() {
    cd "pass_app-${pkgver}"
    /usr/bin/python -m installer --destdir="$pkgdir" dist/*.whl
    
    # Install desktop file
    install -Dm644 pass-kb.desktop "$pkgdir/usr/share/applications/pass-kb.desktop"
    
    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 INSTALL.md "$pkgdir/usr/share/doc/$pkgname/INSTALL.md"
}
