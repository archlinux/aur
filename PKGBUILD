# Maintainer: Aaron Coach <aur@awc.id.au>
_pkgname=pocket-id
pkgname="${_pkgname}-bin"
pkgver=2.14.0
pkgrel=1
pkgdesc="A simple and easy-to-use OIDC provider (Pre-compiled binary)"
arch=('x86_64')
url="https://github.com/pocket-id/pocket-id"
license=('BSD')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=("etc/${_pkgname}/config.env")
install="${_pkgname}.install"

source=(
  "${_pkgname}-v${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}_linux_amd64"
  "config-v${pkgver}.env::https://raw.githubusercontent.com/pocket-id/pocket-id/v${pkgver}/.env.example"
  "LICENSE-v${pkgver}::https://raw.githubusercontent.com/pocket-id/pocket-id/v${pkgver}/LICENSE"
  "${_pkgname}.service"
  "${_pkgname}.sysusers"
  "${_pkgname}.tmpfiles"
)

sha256sums=('da32b4e7bc8ba817ae2cee6e62634834bf234965fa237d25ab38fc3bec58ef48'
            '98e9be8f7efdf7d67e853a76a1a87f525078a21b9d3f3a6c52ac2f19ad76fee8'
            'c4822dc23fddabd9aef6cd1b1e5dfe307cbc36dc0f1d662e82d58ebc886d9d0f'
            '14efeddfe70c3ff949335f78264b3990d0a8781af97e4c071b9144983d48b5ef'
            '48ee29e40d3b949bb884fb6c3bb2b6739626c38a42ab4f8ab10a5a4e3d7c735d'
            'fdead2921933c62fe2a0bccdfa2b2a0ff630edce3a3b62d0a97594302dd05e44')

package() {
  install -Dm755 "${srcdir}/${_pkgname}-v${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm640 "${srcdir}/config-v${pkgver}.env" "${pkgdir}/etc/${_pkgname}/config.env"
  install -Dm644 "${srcdir}/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
  install -Dm644 "${srcdir}/${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
  install -Dm644 "${srcdir}/${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
  install -Dm644 "${srcdir}/LICENSE-v${pkgver}" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
