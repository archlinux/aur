# Maintainer: Cory Sanin <corysanin@outlook.com>

_pkgname=lossless-adapter-manager
pkgname=${_pkgname}
pkgdesc="Management application for the Input Integrety Lossless Adapter Gamecube adapter."
pkgver=0x2010400
pkgrel=1
provides=("${_pkgname}")
conflicts=("LosslessAdapterManager2")
url="https://www.input-integrity.com/"
arch=("x86_64")
license=("freeware-proprietary")
_executablename="${_pkgname}_${pkgver}"
source=("https://mirror.sanin.dev/aur/lossless-adapter-manager/${_executablename}"
        "${_pkgname}.sh"
        "${_pkgname}.desktop"
        "${_pkgname}.svg")
sha1sums=('482a730e8dd9a60cffe0dbb41b9409251d2294e9'
          'ce512b6a45749d59323143273189a96db48a0565'
          '87ede3e2da870c0986f8d2fcbfdbdafa07ace299'
          '3e6ea78f4fd57d35596e64e6dbd664d00e67a465')
sha256sums=('b619a2491579c5813d52e8d9fd90c3b8680638821a466fd58a1b3bd01a2e3f6f'
            '8f5f426441b1a65a5f9f20700035ca72c1747e59db03d4d96ed782c94c916e0c'
            '3e212146833bbe5924f22046839d50d0e67b166c50580481ec2a980cbb4e5d78'
            'f134f6a3de72b4d7dfd518832dcd56b2afe9303b76d7e271db629784e569e84f')
options=(!strip)

prepare() {
  mv "${_executablename}" "${_pkgname}"
	chmod +x "${_pkgname}"
}

package() {
	# executable and symlink
  install -Dpm755 "${_pkgname}" "${pkgdir}/opt/${_pkgname}/${_pkgname}"
	install -dm755 "${pkgdir}/usr/bin"
  install -Dpm755 "${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"

  # Desktop file
  install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # Icon
  install -dm755 "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
  install -Dpm755 "${srcdir}/${_pkgname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg"
}
