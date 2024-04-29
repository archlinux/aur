# Maintainer: Haoxiang Fei <tonyfettes AT tonyfettes DOT com>

pkgname=moonbit-bin
pkgver=0.1.0.20240429
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
sha256sums=('a4d53f938341f1f71e1105fd2d4938511e7b349f723f0f785b7bf15172f88eaf'
            '12cde7039a38ad73af9358cf9e8c13039b9600e3f0d09f46a33e2238702a818f'
            'a23fdf9c58ea2b347818344a951de1e2d4e2c260f56dd97388f3bb32c56b0fc0'
            '5949712cde430bce69b10b580dc8fcf7b3a22dfc92e69ea8611da4164283d59e'
            '37521c30399bcda48604e6b4edbb41d56300882ed01519432c64eef9e415d30c'
            'e802c0700c562ce6a541b087a0952baa8d768e061ba10b8d75ea898d1357553f'
            '9faecc7d0988da7616269ae6a82a162b78d3dd59b5093ba849ce426b04f355ac'
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
