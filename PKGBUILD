# Maintainer: Felipe BF <fprgw32 at gmail dot com>

_basename=solace
pkgname="${_basename}"
pkgver=3.2
_pkgver="${pkgver//./_}"
pkgrel=1
pkgdesc='Sol Anachronistic Computer Emulation: a Sol-20 computer emulator'
url='https://www.sol20.org/solace.html'
arch=('i686' 'x86_64')
license=('LicenseRef-custom')
depends=('sh' 'wine' 'hicolor-icon-theme')

source=(
  "https://www.sol20.org/${_basename}/${_basename}${_pkgver}.zip"
  "LICENSE"
  "${_basename}.sh"
  "${_basename}.desktop"
  "${_basename}-icons.tar.gz"
)
sha256sums=('45461d9a3ff7e9b17fffe9a5b66d49c3d06c6282da405fd0d5138a2424953a1d'
            '6597162eeb6bfe57e163bf86338de1f29e07a69df6c5dcbe29a39812f82969bb'
            '30cc75efff32854bbc8c7858b13dfa617aa69af6aac71b017760401279b7f978'
            'dce4dc9d6d0403a3b32cf2481ae08b90c2bd52cb70ad9bad843c1b2f1ef6cc86'
            'c72708c84094771caf288f0de6b4b1c8f9180dfd149431cc50facb9b21d3df62')

package() {
  cd "$srcdir/Release${pkgver}"

  install -d -m755 "${pkgdir}/usr/share/${pkgname}"
  cp -a * "${pkgdir}/usr/share/${_basename}"

  find "${pkgdir}/usr/share/${pkgname}" -type d -exec chmod 755 "{}" \;
  find "${pkgdir}/usr/share/${pkgname}" -type f -exec chmod 644 "{}" \;

  cd ..

  for size in 16 22 32 48 64 128 256 512; do
    local icon_folder="icons/hicolor/${size}x${size}"
    install -Dm644 "${_basename}_${size}.png" "${pkgdir}/usr/share/${icon_folder}/apps/${_basename}.png"
  done

  cd ..

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm755 "${_basename}.sh" "${pkgdir}/usr/bin/${_basename}"
  install -Dm644 "${_basename}.desktop" "${pkgdir}/usr/share/applications/${_basename}.desktop"
}

