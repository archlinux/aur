# Maintainer: Maoyin Sun <simonmysun@gmail.com>
pkgname=cartlife-bin
_pkgname=${pkgname%-bin}
pkgver=1.6
pkgrel=2
pkgdesc="CartLife, a simulation video game developed by Richard Hofmeier"
arch=('x86_64')
url="https://sourceforge.net/projects/cartlife/"
license=('custom')
depends=('libxext' 'libxcursor' 'libxpm' 'libxxf86vm' 'libx11' 'zlib' 'gcc-libs')
provides=("${_pkgname}")
source=("https://sourceforge.net/projects/cartlife/files/OpenSores_0.1/CartLife_OS_0.1_Linux.zip/download" ${_pkgname}.sh)
sha256sums=('89ccf505311d9d4a495237588fe34d6629acbfd8a040270d2575e05d9196fbdb' '63602e44689c4df168d9d16abbbfbcf7fb9864cea4d15c716a3046c09a199f65')

package() {
  # Launcher
  install -Dm755 "${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"

  # Binaries
  install -Dm755 "Linux/data/ags64" "${pkgdir}/usr/lib/${_pkgname}"
  
  # Libraries
  for f in alleg-alsadigi.so alleg-alsamidi.so libaldmb.so.1 liballeg.so.4.4 libdumb.so.1 libfreetype.so.6 libogg.so.0 libtheora.so.0 libvorbisfile.so.3 libvorbis.so.0 modules.lst; do
    install -Dm644 "Linux/data/lib64/${f}" "${pkgdir}/opt/${_pkgname}/${f}"
  done

  # Assets
  for f in cartlife.ags cartlife.001 cartlife.002 audio.vox speech.vox; do
    install -Dm644 "Linux/data/${f}" "${pkgdir}/usr/share/${_pkgname}/${f}"
  done

  # Default config
  install -Dm644 "Linux/data/acsetup.cfg" "${pkgdir}/usr/share/${_pkgname}/acsetup.cfg"

  # Licenses
  install -Dm644 "Linux/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
  install -Dm644 "Linux/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
  for f in ags liballegro4.4 libdumb1 libfreetype6 libogg0 libtheora0 libvorbis0a; do
    install -Dm644 "Linux/data/licenses/${f}-copyright" "${pkgdir}/usr/share/licenses/${pkgname}/${f}-copyright"
  done
  
  # Docs
  install -Dm644 "Linux/readme.html" "${pkgdir}/usr/share/doc/${pkgname}/readme.html"
  install -Dm644 "Linux/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  for f in ags.jpg ags-over.jpg readme_01.jpg readme_03.jpg; do
    install -Dm644 "Linux/readmeimages/${f}" "${pkgdir}/usr/share/doc/${pkgname}/readmeimages/${f}"
  done
}