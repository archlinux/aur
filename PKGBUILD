# Maintainer: Haoxiang Fei <tonyfettes AT tonyfettes DOT com>

pkgname=moonbit-bin
pkgver=0.1.0.20240108
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
sha256sums=('6fd49f2f93ef9e17687b14a997935394151daeabc696a7c8980609799742030a'
            'ada7ebc1b125e2a3faa3f4d481cc2e25a90bf62e1d6e078b7e6724a7a40c0824'
            '8c27894d592c910aa52f5235fa55234652b18be6a30022ce05adbaf47facb974'
            '6005aa72c4a520da457674e9052259b8e08d5f788a1636f0f7c99bd7c0891b64'
            '102ff20c3347dc2353bacd071c49da98d6a76e86a783e0f977151ac7ce925083'
            '304d7f4cfff94c6f78b572310d84aa42002339fa374b679022f872bc4217af55')

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
