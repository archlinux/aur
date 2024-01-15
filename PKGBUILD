# Maintainer: Haoxiang Fei <tonyfettes AT tonyfettes DOT com>

pkgname=moonbit-bin
pkgver=0.1.0.20240115
pkgrel=1
pkgdesc="Intelligent developer platform for Cloud and Edge using WASM"
arch=('x86_64')
url="https://www.moonbitlang.com/"
license=('unknown')
depends=('glibc' 'gcc-libs' 'openssl-1.1')
provides=("moonbit")
conflicts=("moonbit")
_download_url="https://cli.moonbitlang.com/ubuntu_x86"
source=("${_download_url}/moon"
        "${_download_url}/moonc"
        "${_download_url}/moonfmt"
        "${_download_url}/moonrun"
        "${_download_url}/mooninfo"
        "${_download_url}/moondoc")
sha256sums=('026bd9a9ee35b7bd04b51c777b9265c402afd0284bcddfde43ba39b0462d1b95'
            'b0fc9949f608a50713c1848cc5ea82083b801ef1315ee934b3081058907e5ef1'
            '04860ddad5af21f18920bbc02099e1a0d00a5abec6ac20f88819817f8b5da8db'
            '6005aa72c4a520da457674e9052259b8e08d5f788a1636f0f7c99bd7c0891b64'
            'f1e6f1d9b6786d01831246a3f14603f26e190add5d8aa8fcef89532107dffab4'
            'bc460f4b22a151fc98c8689a7c64e44261cf8923da90469895ef05af118cd387')

pkgver() {
  cd "${srcdir}"
  chmod +x moon
  ./moon version | grep 'moon ' | sed -E 's/moon ([0-9.]+) \((\w+) ([0-9]{4})-([0-9]{2})-([0-9]{2})\)/\1.\3\4\5/g'
}

package() {
  install -Dm 755 "${srcdir}/moon"     "${pkgdir}/usr/bin/moon"
  install -Dm 755 "${srcdir}/moonc"    "${pkgdir}/usr/bin/moonc"
  install -Dm 755 "${srcdir}/moonfmt"  "${pkgdir}/usr/bin/moonfmt"
  install -Dm 755 "${srcdir}/moonrun"  "${pkgdir}/usr/bin/moonrun"
  install -Dm 755 "${srcdir}/mooninfo" "${pkgdir}/usr/bin/mooninfo"
  install -Dm 755 "${srcdir}/moondoc" "${pkgdir}/usr/bin/moondoc"
}
