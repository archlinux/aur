# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=bugnano
_pkgname=fcd
pkgname=${_pkgname}-bin
pkgver=1.0.1
pkgrel=2
pkgdesc='Text mode file manager combining the best features of ranger and mc'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${pkgver}"
arch=('x86_64' 'aarch64')
license=('GPL-3.0-or-later ')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
optdepends=('archivefs: compressed archive support')
replaces=('rnr-fm')
source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}-Linux-x86_64.tar.gz")
source_aarch64=("${url}/releases/download/${pkgver}/${_pkgname}-Linux-arm64.tar.gz")
sha256sums_x86_64=('df3ed819f81e15e2831df56504849f5934f52239393dba4689b808b5fed2a888')
sha256sums_aarch64=('1e5b68ad19c1efd51822f042236a5daa4318d180d02574574d9401c8d5a5c081')

package() {
  cd "${srcdir}/${_pkgname}" || exit

  install -D -m755 "./bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -D -m644 "./share/man/man1/${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
  install -D -m644 "./share/man/man1/${_pkgname}-view.1" "${pkgdir}/usr/share/man/man1/${_pkgname}-view.1"

  install -D -m644 "./share/${_pkgname}/${_pkgname}.sh" "${pkgdir}/usr/share/${pkgname}/${_pkgname}.sh"
  mkdir -p "${pkgdir}/etc/profile.d/"
  ln -rsf "${pkgdir}/share/${pkgname}/${_pkgname}.sh" "${pkgdir}/etc/profile.d/${_pkgname}.sh"
  install -D -m644 "./share/${_pkgname}/${_pkgname}.fish" "${pkgdir}/usr/share/${pkgname}/${_pkgname}.fish"
  mkdir -p "${pkgdir}/etc/fish/functions/"
  ln -rsf "${pkgdir}/share/${pkgname}/${_pkgname}.fish" "${pkgdir}/etc/fish/functions/${_pkgname}.fish"

  install -D -m644 "./share/doc/${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -D -m644 "./share/doc/${_pkgname}/CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"

  install -D -m644 "./share/licenses/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
