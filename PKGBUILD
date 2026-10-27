# Maintainer: agony <27015 at riseup dot net>

pkgname=pocket-tts-bin
pkgver=4.0.1
_bin=pocket-tts-3.3.0
pkgrel=1
pkgdesc="Kyutai's pocket-sized text-to-speech on the CPU, without Python (prebuilt)"
arch=('x86_64' 'aarch64')
url='https://github.com/kyutai-labs/pocket-tts'
license=('MIT')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("pocket-tts=${pkgver}")
conflicts=('pocket-tts')
_release="${url}/releases/download/v${pkgver}"
# v4.0.0 and v4.0.1 publish different files under one asset name, so the
# saved name holds pkgver as well as _bin. It starts with pkgname, since
# pocket-tts-${pkgver} is the text of _bin when both versions are equal
source_x86_64=("${pkgname}-${pkgver}-${_bin}-x86_64.tar.gz::${_release}/${_bin}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-${_bin}-aarch64.tar.gz::${_release}/${_bin}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('9abff0aa138a804e44052952d8c3bdaae247fb267ca8f4b83fe178897d1a0559')
sha256sums_aarch64=('2b9a727bffd86ea6d73370d675cbd91a7db118f11b7f5a60343c2d5da12b187a')

package() {
  cd "${_bin}-${CARCH}-unknown-linux-gnu"
  install -Dm755 pocket-tts -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
