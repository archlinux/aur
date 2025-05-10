# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@proton.me>
_pkgname=cpptools-debug
pkgname="${_pkgname}-bin"
pkgver=1.25.3
pkgrel=2
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
b2sums_x86_64=('21a438b753946fc9f00f12c2ead5aca02d7541e3e1d989a2655707801d8c3a603f5574b802fc060919ebe1b98be9badefa391a06f2f566c6e746948d903610fa')
b2sums_armv7h=('64e6c35e69fdc8b00cfac19309a0ef368f0d01995b5108d6f428f390ccf599f61f39d07a6ca1c79d9a28a1de957c7ec265ad537987a229fa66eeb4234cfa093a')
b2sums_aarch64=('9375d433f9f69559d1642f6749659b9705dd0da76f8eecb908f162ff12e5120d6e33825861ae40779c71bda1f0c203cd334aef10a2df4a0ae66d17198b7f3208')

package() {
	install -dm755 "${pkgdir}/usr/share/${_pkgname}"
	cp -r "${srcdir}/extension/debugAdapters"/. "${pkgdir}/usr/share/${_pkgname}"
	chmod +x "${pkgdir}/usr/share/${_pkgname}/bin/OpenDebugAD7"
	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/usr/share/${_pkgname}/bin/OpenDebugAD7" "${pkgdir}/usr/bin/cppdbg"
    install -Dm644 "${srcdir}/extension/bin/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
