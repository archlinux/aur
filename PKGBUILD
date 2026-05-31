# Maintainer: nathawat <nathawat[at]noreply[dot]codeberg[dot]org>

pkgname=quantumlauncher-bin
pkgver=0.5.1
pkgrel=2
pkgdesc="A simple, powerful Minecraft launcher"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/Mrmayman/quantumlauncher"
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc')
optdepends=('jre-openjdk: external Java runtime for Minecraft Java Edition')
provides=("quantumlauncher=${pkgver}")
conflicts=('quantumlauncher')
options=('!strip' '!debug')

_pkgname=quantumlauncher
_tag=v${pkgver}

source=(
	"README.md::https://raw.githubusercontent.com/Mrmayman/quantumlauncher/${_tag}/README.md"
	"ql_logo_32x32.png::https://raw.githubusercontent.com/Mrmayman/quantumlauncher/${_tag}/assets/icon/32x32/ql_logo.png"
	"ql_logo_128x128.png::https://raw.githubusercontent.com/Mrmayman/quantumlauncher/${_tag}/assets/icon/128x128/ql_logo.png"
	"ql_logo_256x256.png::https://raw.githubusercontent.com/Mrmayman/quantumlauncher/${_tag}/assets/icon/256x256/ql_logo.png"
	"ql_logo_512x512.png::https://raw.githubusercontent.com/Mrmayman/quantumlauncher/${_tag}/assets/icon/512x512/ql_logo.png"
	"${_pkgname}.desktop"
)
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/${_tag}/quantum_launcher_linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/${_tag}/quantum_launcher_linux_aarch64.tar.gz")
source_armv7h=("${pkgname}-${pkgver}-armv7h.tar.gz::${url}/releases/download/${_tag}/quantum_launcher_linux_arm32.tar.gz")

b2sums=('8ba8ddb36e635872e301cb6591ae4fe4bbe4f9cfef1be4cef7f7b63f738d9dabd1e7566ca736d5f42e835ce334ece94863cf9aa20117d14b2d6edf2bbe989841'
        'e76ab4a182252a5670381083695f498a25ebfa838783572acb48e07e703008247155be6d51c865e11f0aac10205f15988922de6b9beab94b63b1ae331ba50742'
        'f2834221807bf43797eba64ff13f297fab23bd8fd45bcb93e184a754c314461583c35fd83e1368d71559451b21acda37915c919f56575498ef412de5b8a8bd03'
        '00b811a5909c1322e85f6d4d9cfa7ada839d0c204050bcc944c9df70fe6bb352ee9c986d446ee602a3036cd93a04e01f1a6b1bd4fe469a78694674b7c11d0b17'
        '6c61d4fd2605b9476f036e02f079d45efb56b99f3c4aba0a89eeccc6648a7271cf4be3b02297c7af53a58bec7b9a36da5e2b91dc74713d082ec4d8e83d4558df'
        '77d785d56a80ead234decccb4c18d2043460f93164f3a6f9c20dbf81a7684d49e430820580711bbbc6b3cb0c6f3d56e325c1dd0bf3397eaf7bb7cb8f09ddc16e')
b2sums_x86_64=('63019d4c178b54cb223d62e6d122a29720431b28fdc46104a5284e80362ce96612c58588cf6498905897be5a36ffc01d657c65519d6e991f627248e3a7cd1af9')
b2sums_aarch64=('ff39738ec47e2a5da2736c6aacda1f1b51a0b5dc228ebed449a4f3de7c8b404d8f5586537ccb4c8ec1f6ff76b9bc4c5773e263bda690683945e8a0dcdcc50f5d')
b2sums_armv7h=('b689ed37220a652d1ece70d87e0b47759c03a62c193827172400267db97ce5ed91a0820878e7856a9265cbea962e9e01e8edd81dfea338f46b7acc0456b668df')

package() {
    install -Dm755 quantum_launcher "${pkgdir}/usr/bin/${_pkgname}"

    local _size
    for _size in 32 128 256 512; do
        install -Dm644 "ql_logo_${_size}x${_size}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/${_pkgname}.png"
    done

    install -Dm644 "${_pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    install -Dm644 README.md \
        "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
