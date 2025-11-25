# Maintainer: Aaron Coach <aur@awc.id.au>
_pkgname=pocket-id
pkgname="${_pkgname}-bin"
pkgver=1.15.0
pkgrel=1
pkgdesc="A simple and easy-to-use OIDC provider (Pre-compiled binary)"
arch=('x86_64')
url="https://github.com/pocket-id/pocket-id"
license=('BSD')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=("etc/${_pkgname}/config.env")

source=(
  "${_pkgname}::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64"
  "config.env::https://raw.githubusercontent.com/pocket-id/pocket-id/v${pkgver}/.env.example"
  "${_pkgname}.service"
  "${_pkgname}.sysusers"
  "${_pkgname}.tmpfiles"
)

sha256sums=('3717df5497c9b4e4c7351b7c0e0e4bafaae9f5491d9933101725dee920fabdc5'
            'a57d3a977f6e19fe6120a2f676b8d93a530cfdf8a69bd9473c53bffb0568d4d0'
            'b3eecd75778be96a757fadb11366d7cc5e166deb7d06c2c75fc6e4d63545d90b'
            '48ee29e40d3b949bb884fb6c3bb2b6739626c38a42ab4f8ab10a5a4e3d7c735d'
            'fdead2921933c62fe2a0bccdfa2b2a0ff630edce3a3b62d0a97594302dd05e44')

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm640 "${srcdir}/config.env" "${pkgdir}/etc/${_pkgname}/config.env"
  install -Dm644 "${srcdir}/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
  install -Dm644 "${srcdir}/${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
  install -Dm644 "${srcdir}/${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
}
