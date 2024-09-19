# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="movie-renamer"
pkgname="${_pkgname}-bin"
pkgver=1.3.10_Alpha
pkgrel=1
pkgdesc="A Java app for easily renaming movie files"
arch=('any')
url="https://code.google.com/archive/p/movie-renamer"
license=('GPL-3.0-or-later')
makedepends=('gendesk')
depends=('hicolor-icon-theme' 'java-runtime' 'sh')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
noextract=("${_pkgsrc}.jar")
source=("${_pkgsrc}.jar::https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/${_pkgname}/Movie%20Renamer-${pkgver}.jar"
        "${_pkgname}.zip::https://storage.googleapis.com/google-code-archive-source/v2/code.google.com/${_pkgname}/source-archive.zip"
        "${_pkgname}.sh")
b2sums=('a27856b00823d3303003f595788a2ba4e066bb2f5a1837b399db45155f9d645f749ffdee2e9cb8df3be7d02780bdd19948069d78ee68081350e994930a4579d7'
        '36d50bdcc8acdac1cbc527d2fe608362274c6864551c7ff2e0c18632f25f86b44720454f284add57a79c18dff4aaed6ab9deb13a776e372bdbc1320253c3e7f4'
        '2d39e173a231b26829eee508011c195973909ab09def001fb3e1ac484412362012af2c281802adb84e8a4c146fee9320e655aff1e423b6477e5b0b6f58dcbbf8')

prepare() {
  cd "${srcdir}"
  gendesk -f \
    --pkgname "${_pkgname}" \
    --name "Movie Renamer" \
    --exec "/usr/bin/${_pkgname}" \
    --icon "${_pkgname}" \
    --categories "AudioVideo;Utility" \
    --comment "${pkgdesc}"
}

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}.sh"      "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm755 "${_pkgsrc}.jar"      "${pkgdir}/usr/share/java/${_pkgname}/${_pkgname}.jar"
  install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  cd "${_pkgname}"
  install -Dm644 "gpl-3.0.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 "Movie Renamer icon.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
}
