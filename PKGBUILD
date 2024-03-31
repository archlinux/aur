# Maintainer: Haoxiang Fei <tonyfettes AT tonyfettes DOT com>

pkgname=moonbit-bin
pkgver=0.1.0.20240304
pkgrel=1
pkgdesc="Intelligent developer platform for Cloud and Edge using WASM"
arch=('x86_64')
url="https://www.moonbitlang.com/"
license=('unknown')
depends=('glibc' 'gcc-libs' 'git')
provides=("moonbit")
conflicts=("moonbit")
_download_url="https://cli.moonbitlang.com/ubuntu_x86"
source=("${_download_url}/moon"
        "${_download_url}/moonc"
        "${_download_url}/moonfmt"
        "${_download_url}/moonrun"
        "${_download_url}/mooninfo"
        "${_download_url}/moondoc")
sha256sums=('aa8fb155503e14432071e1f0dca3e934c7764e2c3dbf5cd766e37802ed1fec07'
            '904d274d1444152392a2f2df7eedc49e513da5cbc9913b5e18dd5dd56bc31740'
            'ae96205cb5f110ca8264f13a200995ebbad9aeea7c2d7d89858a4c5dd69b5e16'
            '7d713257c2620a6551061399e02ffdf47241640b14d8ce34cc461f96b6aa514f'
            'de42a6abae920826e60e76e1afe0110a343209598cffae7e6edfbe641720afac'
            '2c003506510727e56aaf1d41433a1e36fb01f99b122a68dd3790c32b99e40765')

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
