# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@proton.me>
_pkgname=cpptools-debug
pkgname="${_pkgname}-bin"
pkgver=1.26.3
pkgrel=1
pkgdesc='Debug adapter extraced from vscode-cpptools'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://github.com/Microsoft/vscode-cpptools'
license=('LicenseRef-custom')
# depends=('lttng-ust2.12')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("$pkgname-${epoch:+"$epoch:"}$pkgver-$pkgrel-x86_64.zip::https://github.com/microsoft/vscode-cpptools/releases/download/v${pkgver}/cpptools-linux-x64.vsix")
source_armv7h=("$pkgname-${epoch:+"$epoch:"}$pkgver-$pkgrel-armv7h.zip::https://github.com/microsoft/vscode-cpptools/releases/download/v${pkgver}/cpptools-linux-arm32.vsix")
source_aarch64=("$pkgname-${epoch:+"$epoch:"}$pkgver-$pkgrel-aarch64.zip::https://github.com/microsoft/vscode-cpptools/releases/download/v${pkgver}/cpptools-linux-arm64.vsix")
b2sums_x86_64=('0aedc6efce20f35286db8dd8d20d1876774c6e488b003be81d4a3c78618590ec4a7bf593fdd5f3cf781dd18cf75b408a557df2e576f968291ac753fae21f4518')
b2sums_armv7h=('1072e36d31a1bf5be5a9779292098b1c8528d25dd8dd12981792eded21f7a810a4ea5c74262884cfc491179976e8e190ac76ca7038ad23ac1b9e5e3c4011f1d1')
b2sums_aarch64=('defc17e8ed2f9b366b5f85821bf92f1043805c904dff51af947c17fd34b7d5bf528479d7452b745cd055912797fb66b0acb9a720ca64bc4e4fe85f34902ac9f8')

package() {
	install -dm755 "${pkgdir}/usr/share/${_pkgname}"
	cp -r "${srcdir}/extension/debugAdapters"/. "${pkgdir}/usr/share/${_pkgname}"
	chmod +x "${pkgdir}/usr/share/${_pkgname}/bin/OpenDebugAD7"
	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/usr/share/${_pkgname}/bin/OpenDebugAD7" "${pkgdir}/usr/bin/cppdbg"
    install -Dm644 "${srcdir}/extension/bin/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
