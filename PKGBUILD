# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@proton.me>
_pkgname=cpptools-debug
pkgname="${_pkgname}-bin"
pkgver=1.22.9
pkgrel=1
pkgdesc='Debug adapter extraced from vscode-cpptools'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://github.com/Microsoft/vscode-cpptools'
license=('LicenseRef-custom')
# depends=('lttng-ust2.12')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("extension_x86_64.zip::https://github.com/microsoft/vscode-cpptools/releases/download/v${pkgver}/cpptools-linux-x64.vsix")
source_armv7h=("extension_armv7h.zip::https://github.com/microsoft/vscode-cpptools/releases/download/v${pkgver}/cpptools-linux-arm32.vsix")
source_aarch64=("extension_aarch64.zip::https://github.com/microsoft/vscode-cpptools/releases/download/v${pkgver}/cpptools-linux-arm64.vsix")
b2sums_x86_64=('9e3ef09362bfe5bdb193b3119c40926057c2ddea8e64d4a4bd1094c9550205518dc94302232ad23e10d1cee51de13270eb75d8fd95b1b4eaad78d32f9b5821e4')
b2sums_armv7h=('224cc7929a034752828e175807017d58b2f2ffd5b9efa415b34b857bea3b517b263b17ca162d07ce98a7f63f9afbe664c50c64e28cea9ac8bab5bb17ec0795ff')
b2sums_aarch64=('908c5639c2e2a7a942d16079b80eb98092a06b6600279641a0350a1fb4bd79cf355191138db45483833b3e55a0244b43e75ca2278025a143e5c3847c0b1bc56c')

package() {
	install -dm755 "${pkgdir}/usr/share/${_pkgname}"
	cp -r "${srcdir}/extension/debugAdapters"/. "${pkgdir}/usr/share/${_pkgname}"
	chmod +x "${pkgdir}/usr/share/${_pkgname}/bin/OpenDebugAD7"
	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/usr/share/${_pkgname}/bin/OpenDebugAD7" "${pkgdir}/usr/bin/cppdbg"
    install -Dm644 "${srcdir}/extension/bin/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
