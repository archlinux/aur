# Maintainer:  Luis Martinez <luis dot martinez at disroot dot org>
# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Ronuk Raval <ronuk.raval at gmail dot com>
# Contributor: Narrat <autumn-wind at web dot de>
# Contributor: David Scholl <djscholl at gmail dot com>

pkgname=leo
pkgver=6.5
pkgrel=1
pkgdesc="Outliner, Editor, and Personal Information Manager"
arch=('any')
url="https://leoeditor.com"
license=('MIT' 'BSD')
depends=(
	'python-pyqt5'
	'python-pyqtwebengine'
	'python-asttokens'
	'python-docutils'
	'python-flexx'
	'python-meta'
	'python-pylint'
	'python-pyflakes'
	'python-black'
	'python-pyshortcuts'
	'python-sphinx'
	'jupyter-nbformat'
	'shared-mime-info')
makedepends=('python-setuptools')
optdepends=('python-pyenchant: spellchecking support')
provides=('leo-editor')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/leo-editor/leo-editor/archive/v${pkgver}.tar.gz"
        'leo.desktop'
        'leo.xml')
sha256sums=('cbec84798c1167c76802297ef8c1e39783ced0697b0a257b233585cbc6a4ad21'
            '4633876eb91eff206660359ee7da459211e8f87fd73ebbc680fd437c70b63467'
            '630852279324b0d9acf656c4684f16777d64f49b4062bd101c5cddbfc33c82cb')

build() {
	cd "${pkgname}-editor-${pkgver}"
	python setup.py build
}

package() {
	cd "${pkgname}-editor-${pkgver}"
	PYTHONHASHSEED=0 python setup.py install --skip-build --root="$pkgdir/" --optimize=1
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname/"
	install -Dm644 "$srcdir/leo.desktop" -t "${pkgdir}/usr/share/applications/"
	install -Dm644 "$srcdir/leo.xml" -t "${pkgdir}/usr/share/mime/packages/"
	install -Dm644 "leo/Icons/application-x-leo-outline.png" "${pkgdir}/usr/share/pixmaps/leo.png"
}
