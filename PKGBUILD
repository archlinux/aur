# Maintainer:  Edgar Vincent <e-v@posteo.net>
_pkgname=waked
pkgname=${_pkgname}-bin
pkgrel=1
pkgver=0.1.1
# See http://julianfairfax.gitlab.io/waked-prebuilt/version.txt
pkgdesc="Daemon to let other applications wake up the system. Binary version."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/seath1/waked"
license=('GPL2')
depends=('sdbus-cpp')
provides=("$_pkgname")
conflicts=("${_pkgname}-git")
_commit=05729fb50d6d032f7d269b5fd3068f8bd17b31fe
source=("git+https://gitlab.com/seath1/waked.git#commit=${_commit}")
source_x86_64=("${pkgname}::https://julianfairfax.gitlab.io/${_pkgname}-prebuilt/amd64/waked"
               "${pkgname}.asc::https://julianfairfax.gitlab.io/${_pkgname}-prebuilt/amd64/waked.asc")
source_aarch64=("${pkgname}::https://julianfairfax.gitlab.io/${_pkgname}-prebuilt/arm64/waked"
                "${pkgname}.asc::https://julianfairfax.gitlab.io/${_pkgname}-prebuilt/arm64/waked.asc")
sha256sums=('SKIP')
sha256sums_x86_64=('ed105a81e6907f355ebf1e6b0af5cb1d1c660e63cff4559c7a218fe6fa746a7e'
                  'SKIP')
sha256sums_aarch64=('b64620761728a4e51f9b2af27ccaa852700b4b725f478a1ced021fe9d88b1e17'
                   'SKIP')
validpgpkeys=('C123CB2B21B9F68C80A03AE005B2039A85E7C70A')

package() {
  install -Dm0755 -T "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 -t "${pkgdir}/usr/lib/systemd/system/" "${srcdir}/${_pkgname}/${_pkgname}.service"
  install -Dm644 -t "${pkgdir}/etc/dbus-1/system.d/" "${srcdir}/${_pkgname}/de.seath.Waked.conf"
}

# vim:set ts=2 sw=2 et:
