# Maintainer: Cory Sanin <corysanin@outlook.com>

_pkgname=lossless-adapter-manager
_executablename=LosslessAdapterManager2
pkgname=${_pkgname}
pkgdesc="Management application for the Input Integrety Lossless Adapter Gamecube adapter."
pkgver=2023.12.04
pkgrel=1
provides=("${_pkgname}")
conflicts=("${_executablename}")
url="https://www.input-integrity.com/"
arch=("x86_64")
license=("freeware-proprietary")
_archive="${_pkgname}_${pkgver}"
source=("https://mirror.sanin.dev/aur/lossless-adapter-manager/${_archive}.tar.gz"
        "${_pkgname}.desktop")
sha1sums=('2db9c7010be833c5e11df669e42a3af63df8a6ab'
          '87ede3e2da870c0986f8d2fcbfdbdafa07ace299')
sha256sums=('c85efc26295c4adb966c1746c6557e36953d4561a02f99d6b42f42ade5bdfe79'
            '3e212146833bbe5924f22046839d50d0e67b166c50580481ec2a980cbb4e5d78')
options=(!strip)

prepare() {
  mv "${_executablename}" "${_pkgname}"
	chmod +x "${_pkgname}"
}

package() {
	# executable and symlink
  install -Dpm755 "${_pkgname}" "${pkgdir}/opt/${_pkgname}/${_pkgname}"
  install -Dpm755 *.so "${pkgdir}/opt/${_pkgname}/"
	install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  # Desktop file
  install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
