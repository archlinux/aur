# Maintainer: EatMyVenom <eat.my.venomm@gmail.com>

_name=electron-beta
pkgname=electron-beta-bin
_ver="12.0.0-beta.12"
pkgver=12.0.0.beta.14
pkgrel=1
pkgdesc="Build cross platform desktop apps with web technologies"
arch=('x86_64')
url="https://electronjs.org/"
license=('MIT' 'custom')
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libxslt' 'minizip'
         'nss' 're2' 'snappy')
makedepends=('tar')
provides=('electron' 'electron-beta')
conflicts=()
replaces=()
source=("https://github.com/electron/electron/releases/download/v${_ver}/electron-v${_ver}-linux-x64.zip")
md5sums=('4d9e7c17031127c5743fe1f0c49ad4df')

package() {
  cd $srcdir
  install -dm755 "${pkgdir}/usr/lib/${_name}"
  cp -r "./" "${pkgdir}/usr/lib/${_name}" 

  chmod u+s "${pkgdir}/usr/lib/${_name}/chrome-sandbox"

  install -dm755 "${pkgdir}/usr/share/licenses/${_name}"
  for l in "${pkgdir}/usr/lib/${_name}"/{LICENSE,LICENSES.chromium.html}; do
    ln -s  \
      "$(realpath --relative-to="${pkgdir}/usr/share/licenses/${_name}" "${l}")" \
      "${pkgdir}/usr/share/licenses/${_name}"
  done

  install -dm755 "${pkgdir}"/usr/bin
  ln -s "../lib/${_name}/electron" "${pkgdir}/usr/bin/${_name}"

}
