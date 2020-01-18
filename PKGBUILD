# Contributor: Ronuk Raval <ronuk.raval at gmail dot com>
# Contributor: Narrat <autumn-wind at web dot de>
# Contributor: David Scholl <djscholl at gmail dot com>

pkgname=leo
pkgver=6.1
pkgrel=1
pkgdesc="Literate programmer's editor, outliner, and project manager"
arch=('any')
url="http://leoeditor.com/"
license=('custom')
depends=(
    python
    python-setuptools
    desktop-file-utils
    shared-mime-info

    python-pyqt5
    python-docutils
    python-flexx
    python-meta
    jupyter-nbformat
    python-pylint
    python-pyflakes
    python-shortcutter
    python-sphinx
    python-future
    python-six
)
optdepends=('python-pyenchant: spellchecking support')
source=(
    ${pkgname}-${pkgver}.tar.gz::https://github.com/leo-editor/leo-editor/archive/v${pkgver}.tar.gz
    leo.desktop
    leo.xml
    setup.py.patch
    MANIFEST.in
)
sha256sums=('dc08f8e765b9ac990afb485466493de3e00f607cb2ec149cf925532f3811f994'
            '7b326791378eefedecee2474c4e1a497838d2a06ff4259a195d817c38588395b'
            '630852279324b0d9acf656c4684f16777d64f49b4062bd101c5cddbfc33c82cb'
            '20c22bd8a2e892c484d90c7643ab820454f9e6d892fa48a6075395ec2e2ebcc9'
            '03ef3e169f8761c1b1624f2e49058005b0fc94a1591d201436221df119c8d41e')


prepare() {
    cd "leo-editor-${pkgver}"
    patch -Np1 -i ../setup.py.patch
}

build() {
    cd "leo-editor-${pkgver}"
    cp ../MANIFEST.in ./
    python setup.py build
}

package() {
    cd "leo-editor-${pkgver}"

    python setup.py install --skip-build --root="$pkgdir/" --optimize=1
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m644 "$srcdir/leo.desktop" "$pkgdir/usr/share/applications/leo.desktop"
    install -D -m644 "$srcdir/leo.xml" "$pkgdir/usr/share/mime/packages/leo.xml"
    install -D -m644 "leo/Icons/application-x-leo-outline.png" "$pkgdir/usr/share/pixmaps/leo.png"
}
