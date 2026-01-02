# Maintainer: Aaron Coach <aur@awc.id.au>
_pkgname=pocket-id
pkgname="${_pkgname}-bin"
pkgver=2.0.1
pkgrel=2
pkgdesc="A simple and easy-to-use OIDC provider (Pre-compiled binary)"
arch=('x86_64')
url="https://github.com/pocket-id/pocket-id"
license=('BSD')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=("etc/${_pkgname}/config.env")
install="${_pkgname}.install"

source=(
  "${_pkgname}::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64"
  "config.env::https://raw.githubusercontent.com/pocket-id/pocket-id/v${pkgver}/.env.example"
  "https://raw.githubusercontent.com/pocket-id/pocket-id/v${pkgver}/LICENSE"
  "${_pkgname}.service"
  "${_pkgname}.sysusers"
  "${_pkgname}.tmpfiles"
)

sha256sums=('6e15119553b090353dd4cebbaed95c522af39e0454e34e46452e7d11f8087e55'
            'a16d41415d11c4cf586cb67147190678181abef880306aca6f5267bd496a1a67'
            'c4822dc23fddabd9aef6cd1b1e5dfe307cbc36dc0f1d662e82d58ebc886d9d0f'
            'b3eecd75778be96a757fadb11366d7cc5e166deb7d06c2c75fc6e4d63545d90b'
            '48ee29e40d3b949bb884fb6c3bb2b6739626c38a42ab4f8ab10a5a4e3d7c735d'
            'fdead2921933c62fe2a0bccdfa2b2a0ff630edce3a3b62d0a97594302dd05e44')

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm640 "${srcdir}/config.env" "${pkgdir}/etc/${_pkgname}/config.env"
  install -Dm644 "${srcdir}/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
  install -Dm644 "${srcdir}/${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
  install -Dm644 "${srcdir}/${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
