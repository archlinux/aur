# Maintainer: tonitch <d.tonitch@gmail.com>
# Contributor: leux08 <contato@leux08.dev.br>
# Contributor: Brian Thompson <brianrobt@pm.me>

pkgname=pixieditor-bin
_pkgname=pixieditor
pkgver=2.1.1.5
pkgrel=1
pkgdesc="Universal 2D Graphics Editor"
arch=('x86_64')
url="https://pixieditor.net"
license=('LGPL-3.0-only')
provides=("pixieditor")
conflicts=("pixieditor")
depends=(
  'fontconfig'
  'gcc-libs'
  'glibc'
  'libxcursor'
  'zlib'
)
noextract=("${pkgname}-${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/PixiEditor/PixiEditor/releases/download/$pkgver/PixiEditor-$pkgver-amd64-linux.tar.gz"
		"PixiEditor.desktop"
		"pixieditor.sh")
sha256sums=('4fedf0fac5d55d967be3c25dad5b8894472e3ccc8ee110ded2d9d808a6c361e8'
            '9d434d1b1541b73159cdbdec282f6e8cf98d7f5630313f8c08b7b9b9bb62a289'
            '8ff9b2644b6705fcb3c1f0b581cdc4c82c4d657c58ee7e9e039335d97ebef1ac')

prepare(){
	mkdir -p "${srcdir}/${pkgname}-${pkgver}"
	tar xf "${pkgname}-${pkgver}.tar.gz" -C "${srcdir}/${pkgname}-${pkgver}"
}

package() {
	mkdir -p "${pkgdir}/opt/${pkgname}"
	cp -r "${srcdir}/${pkgname}-${pkgver}/." -t "${pkgdir}/opt/${pkgname}"

	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/Assets/PixiEditorLogo.png" "${pkgdir}/usr/share/pixmaps/pixieditor.png"
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	install -Dm755 "${srcdir}/pixieditor.sh" "${pkgdir}/usr/bin/pixieditor"
	install -Dm644 "${srcdir}/PixiEditor.desktop" "${pkgdir}/usr/share/applications/PixiEditor.desktop"
}
