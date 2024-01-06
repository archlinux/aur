# Maintainer: Cory Sanin <corysanin@outlook.com>

_pkgname=lossless-adapter-manager
pkgname=${_pkgname}
pkgdesc="Management application for the Input Integrety Lossless Adapter Gamecube adapter."
pkgver=0x2010500
pkgrel=1
provides=("${_pkgname}")
conflicts=("LosslessAdapterManager2")
url="https://www.input-integrity.com/"
arch=("x86_64")
license=("freeware-proprietary")
makedepends=("gzip")
_executablename="${_pkgname}_${pkgver}"
source=("https://mirror.sanin.dev/aur/lossless-adapter-manager/${_executablename}.gz"
        "${_pkgname}.sh"
        "${_pkgname}.desktop"
        "${_pkgname}.svg")
sha1sums=('f63056014a18e675825df50b94da1a2de3642c98'
          'ce512b6a45749d59323143273189a96db48a0565'
          '87ede3e2da870c0986f8d2fcbfdbdafa07ace299'
          '3e6ea78f4fd57d35596e64e6dbd664d00e67a465')
sha256sums=('bf5c916115a1b9194971ad5a59de46ba4e70c4560e328e6f9e930faa8bbfbc49'
            '8f5f426441b1a65a5f9f20700035ca72c1747e59db03d4d96ed782c94c916e0c'
            '3e212146833bbe5924f22046839d50d0e67b166c50580481ec2a980cbb4e5d78'
            'f134f6a3de72b4d7dfd518832dcd56b2afe9303b76d7e271db629784e569e84f')
options=(!strip)

prepare() {
  gzip -df "${_executablename}.gz"
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
