# Maintainer: Ronuk Raval <ronuk.raval at gmail dot com>
# Contributor: Narrat <autumn-wind at web dot de>
# Contributor: David Scholl <djscholl at gmail dot com>

pkgname=leo
pkgver=6.0
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
sha256sums=(
    37a534cb5b567cf6cf6a816d9eb8f65aac201a166b050bbe04507182851e4a6c
    7b326791378eefedecee2474c4e1a497838d2a06ff4259a195d817c38588395b
    630852279324b0d9acf656c4684f16777d64f49b4062bd101c5cddbfc33c82cb
    6212a47d5e6b171dc3bcf845bcae007454145958eab6da441c0b2676e573724a
    03ef3e169f8761c1b1624f2e49058005b0fc94a1591d201436221df119c8d41e
)

build() {
    cd "leo-editor-${pkgver}"
    patch -i ../setup.py.patch
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
