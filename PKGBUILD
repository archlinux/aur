# Maintainer: Haoxiang Fei <tonyfettes AT tonyfettes DOT com>

pkgname=moonbit-bin
pkgver=0.1.0.20240415
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
sha256sums=('f24f7685efcf1165c0dff94c43ce321f8c18097f77b858989e37dccbb7c68704'
            'afc4ba1957f3e30ea684d6ca5b6b23708675f9586cc6cff4a4d57a4304477189'
            'a4f8f972ecd1a995430d156a79487a7016495b524819173023ff93ab146b51d7'
            '53842027da2c14f2bcceaa803fd0a276043e147ab2052bff8bbce6ee6955c50f'
            '132f97f82cfda410bdfded6f0c8025f47ebdb62bef7b906e8b77d4d7ae2b59bd'
            '0414f72f1ee42189e7f568f04f9b12b7606b4622caa629a3ff0497b75cf9c611'
            'c40a77d8d1cbb8fdd1d5ada588bd50619eabf873b24179be45ff3e62de13ab42'
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
