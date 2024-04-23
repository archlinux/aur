# Maintainer: Haoxiang Fei <tonyfettes AT tonyfettes DOT com>

pkgname=moonbit-bin
pkgver=0.1.0.20240422
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
sha256sums=('d5afcf0fb0c16d433772eeac0501ea05fc17f53e870abecf50c69bdfdd52a25a'
            'b026302aecfa7e81445723efcdfa83f7f3925940dd5b52bfd9db0cf828c3bcd3'
            '2ea89467ceac0d88e42d63aed9b862e8d114017ccd02aea26a5aeaf08fe4c15c'
            '53842027da2c14f2bcceaa803fd0a276043e147ab2052bff8bbce6ee6955c50f'
            '6ab59adf5bac911c169f5d7f3685b1be654d82b149cb4a4b138ad28fcdf0df71'
            '80db5f80559bba2498424787c9e46b70ebbd6ee572b040e44e77f20226eda6ef'
            '9c019b02c2d098a454917c232b12d6b16f396904e63ff575feebbd55f310cef9'
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
