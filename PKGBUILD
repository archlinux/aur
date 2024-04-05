# Maintainer: Haoxiang Fei <tonyfettes AT tonyfettes DOT com>

pkgname=moonbit-bin
pkgver=0.1.0.20240403
pkgrel=2
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
        "https://github.com/tonyfettes/moonbit-aur/releases/download/v0.1.0.20240403/core.zip"
        "moon.sh")
sha256sums=('197b04be0e292be8a7797893695b5df0cee736975249b79f2c8919cca6bc66d0'
            'f5766fd8737129140b2059cb8d23af00cb194b83b47fdf6bf004570fcb8f0b32'
            '04f74df31051bb0f16243b9ff8fb3975445b2620c4e18edbad30de0bf2adf7a0'
            '53842027da2c14f2bcceaa803fd0a276043e147ab2052bff8bbce6ee6955c50f'
            '81f34a423b2a40ed0c499d1c148a7e33a300ce7c8505146c12586ee81a78458b'
            '750db712196c09e1c033fede6a996acc359a464b98d0815232d44cbd25699025'
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
