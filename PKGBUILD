# Maintainer: Haoxiang Fei <tonyfettes AT tonyfettes DOT com>

pkgname=moonbit-bin
pkgver=0.1.0.20240507
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
sha256sums=('1425ade599dc5f37404c2397563bcdfcf61d7179b3aabc5d7caba645e35fb24a'
            'a2aad7a8aa878054341b45d5e7624022e2c53e3ac91c819c8c20d66240bde25f'
            '5d7465a7c0f8e16e95de991f89d370905cfb2315bd763666715d59bcda295cb6'
            'fcef2ee8ba0c2b64488eb6159445a02c6b9dceec45ed8207f2cf06c1597ae8cf'
            '79bb7e05c345e56015e75e3f3436c9a2f4028d6ceaf3b3ac7b33a44c0aa2cbc7'
            'ebb572388c1d8da52259ba4448f19ee78d91903a566ec8314d601d6260142d27'
            '3a976d85a9d680cf5e6d02e37609187b98de84e1799c2ef0c05ff8fac82ac9b5'
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
