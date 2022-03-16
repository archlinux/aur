# Maintainer: Archfae <archfae ta protonmail dot com>
# Contributor: Tom Bebbington <tombebb@protonmail.com>

pkgname=kode-studio-bin
_pkgname=kode-studio
pkgver=18.11
pkgrel=6
pkgdesc="Kode Studio is an IDE specifically tailored for Kha."
arch=('x86_64')
url="http://kha.tech/download"
license=('MIT')
builddepends=('curl' 'python')
options=('!strip')
depends=(fontconfig libxtst gtk2 python cairo alsa-lib gconf nss gcc-libs libnotify libxss gvfs)
optdepends=('haxe: third-party Haxe library support'
            'gcc: Linux target'
            'libxinerama: Linux target'
            'mesa: Linux target'
            'unity-editor: Unity target IDE'
            'android-studio: Android target IDE'
            'codeblocks: Linux target IDE'
            'eclipse-java: Java target IDE')
source_x86_64=("https://github.com/Kode/KodeStudio/releases/download/v${pkgver}/KodeStudio-Linux.tar.xz"
               "${_pkgname}.desktop"
               'print-version.py'
               )
sha256sums_x86_64=('SKIP'
                   '085056b38a51192641b9c7daac35515491c1202374369a9b1e19cdf764273c11'
                   '516503d1aa701c51cc9a89c31c97f1a01f8007641b667ab326ab5ba7c3e5e46f'
                   )

pkgver() {
  cd $srcdir
  curl "https://api.github.com/repos/Kode/KodeStudio/releases" -o releases.json
  python print-version.py
}
package() {
  install -d "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -d "${pkgdir}/opt/${_pkgname}"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/icons" 

  install -m644 "${srcdir}/resources/app/LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -m644 "${srcdir}/resources/app/resources/linux/code.png" "${pkgdir}/usr/share/icons/${_pkgname}.png"
  install -m644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  cp -r "${srcdir}/"* "${pkgdir}/opt/${_pkgname}" -R
  ln -s /opt/${_pkgname}/bin/kodestudio "${pkgdir}"/usr/bin/kodestudio
  ln -s /opt/${_pkgname}/bin/kodestudio "${pkgdir}"/usr/bin/${_pkgname}
}
