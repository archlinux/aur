# Maintainer: Cory Sanin <corysanin@outlook.com>

_pkgname=lossless-adapter-manager
_executablename=LosslessAdapterManager2
pkgname=${_pkgname}
pkgdesc="Management application for the Input Integrety Lossless Adapter Gamecube adapter."
pkgver=2023.11.30
pkgrel=1
provides=("${_pkgname}")
conflicts=("${_executablename}")
url="https://www.input-integrity.com/"
arch=("x86_64")
license=("freeware-proprietary")
_archive="${_pkgname}_${pkgver}"
source=("https://mirror.sanin.dev/aur/lossless-adapter-manager/${_archive}.tar.gz"
        "${_pkgname}.desktop")
sha1sums=('01ec65bcd5e06eb715fb71928dd68e1c946012a4'
          '87ede3e2da870c0986f8d2fcbfdbdafa07ace299')
sha256sums=('a5c8af56f2907ff63fcda0980111275448ab241db0d142e1831e25eb750b259d'
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
