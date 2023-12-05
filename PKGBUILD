# Maintainer: Cory Sanin <corysanin@outlook.com>

_pkgname=lossless-adapter-manager
_executablename=LosslessAdapterManager2
pkgname=${_pkgname}
pkgdesc="Management application for the Input Integrety Lossless Adapter Gamecube adapter."
pkgver=2023.12.05
pkgrel=1
provides=("${_pkgname}")
conflicts=("${_executablename}")
url="https://www.input-integrity.com/"
arch=("x86_64")
license=("freeware-proprietary")
_archive="${_pkgname}_${pkgver}"
source=("https://mirror.sanin.dev/aur/lossless-adapter-manager/${_archive}.tar.gz"
        "${_pkgname}.desktop"
        "${_pkgname}.svg")
sha1sums=('a9f93824285d1d6034ff5a62f7348000bc40973d'
          '87ede3e2da870c0986f8d2fcbfdbdafa07ace299'
          '3e6ea78f4fd57d35596e64e6dbd664d00e67a465')
sha256sums=('1abfbf4fe1935a3994701bbdd9480d1b52e79a1c61296b9f120bd55e14f7c736'
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
  install -Dpm755 *.so "${pkgdir}/opt/${_pkgname}/"
	install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  # Desktop file
  install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # Icon
  install -dm755 "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
  cp -r --no-preserve=mode,ownership "${srcdir}/${_pkgname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg"
}
