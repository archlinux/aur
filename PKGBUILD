# Maintainer: Koutheir Attouchi <koutheir at gmail dot com>
_github_user_name='sevaa'
pkgname=dwex
pkgver=4.56
pkgrel=1
pkgdesc='GUI viewer for DWARF debug information'
arch=('x86_64')
url="https://github.com/${_github_user_name}/${pkgname}"
license=('BSD-3-Clause')
depends=('python>=3.6.1' 'python-filebytes>=0.10.1' 'python-pyelftools>=0.32' \
         'python-pyqt6>=6.9' 'qt6-svg>=6.9')
makedepends=('python-setuptools>=1:79')
checkdepends=()
optdepends=()
backup=()
options=()
install=
source=("https://github.com/${_github_user_name}/${pkgname}/archive/refs/tags/${pkgver}.tar.gz" \
        "${pkgname}.png" "${pkgname}.desktop")
noextract=()
sha256sums=(1da59ed96e6e46320a2b8c4c3a305fc1ec498571d7369d728634dd9bec3e6e29 \
            d92d16891381310a4b18cc8ae59a1a0ac99a07ca80599a7e3c003970622ba03f \
            155036828925419fe6ab40d600d5e5ada249e1b47095d17bddf7aa694a0cdb6d)
validpgpkeys=()

prepare() {
    cd "$pkgname-$pkgver"
}

build() {
    cd "$pkgname-$pkgver"

    python setup.py build --verbose
}

check() {
    cd "$pkgname-$pkgver"

    python setup.py check --verbose --strict
}

package() {
    cd "$pkgname-$pkgver"

    # Install the program.
    python setup.py install --verbose --single-version-externally-managed --compile --optimize=2 \
        --prefix=/usr "--root=$pkgdir"

    # Install desktop shortcut and icons.
    install --verbose --preserve-timestamps -D \
        "--target-directory=$pkgdir/usr/share/applications" "$srcdir/${pkgname}.desktop"
    install --verbose --preserve-timestamps -D \
        "--target-directory=$pkgdir/usr/share/icons/hicolor/48x48/apps" "$srcdir/${pkgname}.png"
}
