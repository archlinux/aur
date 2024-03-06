# Maintainer: Haoxiang Fei <tonyfettes AT tonyfettes DOT com>

pkgname=moonbit-bin
pkgver=0.1.0.20240115
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
sha256sums=('0738e07c8166d7129e866fa7cf4e5d35febe2eaa1f051c8a250e1d525a5b0205'
            '416391e7517cd79713e5b375c749ec48393470fc1bfe1c1abb38d930a227bb84'
            'ea47121dbd1673b1395150ce6ac337cb0a1d4ca6f7a1eb56ce03127b9dced0fa'
            '4bb85c272ba6d2bb62d3a0c2d6cd435274366a5230c758c72d2d098ab1233d71'
            'd55242c6a384f8482e53ad6c5d68e8e2593f4b35270c30a555f64ed4d8e9c71d'
            'c1ff3738f8ca3e558d9b1a0aeb58743f9c3b641357f2902af83f63de7397a97b')

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
