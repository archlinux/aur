# Maintainer: Haoxiang Fei <tonyfettes AT tonyfettes DOT com>

pkgname=moonbit-bin
pkgver=0.1.0.20240506
pkgrel=1
pkgdesc="Intelligent developer platform for Cloud and Edge using WASM"
arch=('x86_64')
url="https://www.moonbitlang.com/"
license=('unknown')
depends=('glibc' 'gcc-libs' 'git')
provides=("moonbit")
conflicts=("moonbit")
options=('!debug')
_origin="https://cli.moonbitlang.com"
source=("${_origin}/ubuntu_x86/moon"
        "${_origin}/ubuntu_x86/moonc"
        "${_origin}/ubuntu_x86/moonfmt"
        "${_origin}/ubuntu_x86/moonrun"
        "${_origin}/ubuntu_x86/moondoc"
        "${_origin}/ubuntu_x86/mooninfo"
        "https://github.com/tonyfettes/moonbit-archlinux/releases/download/v${pkgver}/core.zip"
        "moon.sh")
sha256sums=('dc74c4a628409d08b660252e81c351a1fde01a690e070d75e5bb2c27fe82ca3c'
            '43584c66d7689b94d5239f07a5534cc412b22ad80ad1c75e27cf458770f28fc0'
            '8a86a7c376e1aaa5e3cc4b35ac416c64aa01ba7ce8223e7faff06e3e93b2ee9c'
            'c546b2c26527a01ebccf0a918e5731baec2ea63c791345a8cef18f672024c80f'
            '64b7bdf524bc27d28e8b01611bcbbb37021da916f8e47d76fc04e4d74ae450ae'
            'adec46aaa4f2ecd139bc1d8c52a0a04773690f05b09397cad3ea7d5c69a673f2'
            'aef5b8ec65d173d8ccbf4163928720af24f82702a9c77a3bb7bbf9bc51acb335'
            '58b177a4b0dda035620b8f5f44f1f26a251203924d1df927a8a00e0a78f9c13c')

pkgver() {
  cd "${srcdir}"
  chmod +x moon
  ./moon version | grep 'moon ' | sed -E 's/moon ([0-9.]+) \((\w+) ([0-9]{4})-([0-9]{2})-([0-9]{2})\)/\1.\3\4\5/g'
}

package() {
  install -Dm 755 "${srcdir}/moon"     "${pkgdir}/usr/lib/moon"
  install -Dm 755 "${srcdir}/moon.sh"  "${pkgdir}/usr/bin/moon"
  install -Dm 755 "${srcdir}/moonc"    "${pkgdir}/usr/bin/moonc"
  install -Dm 755 "${srcdir}/moondoc"  "${pkgdir}/usr/bin/moondoc"
  install -Dm 755 "${srcdir}/moonfmt"  "${pkgdir}/usr/bin/moonfmt"
  install -Dm 755 "${srcdir}/moonrun"  "${pkgdir}/usr/bin/moonrun"
  mkdir -p "${pkgdir}/usr/share/moonbit/lib"
  cp -r "${srcdir}/core" "${pkgdir}/usr/share/moonbit/lib/"
}
