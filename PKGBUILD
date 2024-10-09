# Maintainer: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>
# Co-Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=sachaos
_pkgname=viddy
pkgname=${_pkgname}-bin
pkgver=1.1.6
pkgrel=2
pkgdesc='A modern watch command. Time machine and pager.'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'i686' 'aarch64')
license=('MIT')
depends=('glibc')
makedepends=('help2man')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-x86_64.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-i686.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-arm64.tar.gz")
sha256sums=('e6eea22d4e9e0aa6a78d0f9126009ec041ea047f94b320c003c34a631821f953'
            '9559b7e87d0816c9c3f4d198fa6045c6db3d5b87794e5ed0c35bee3d6ff3dd6d')
sha256sums_x86_64=('55c350fe71dc78546bf76a062378b5e668cc8f5cbf8252d13723b7173bc1c769')
sha256sums_i686=('5b3c5d37e4b32221555472e23765714a5b2d7056710b1380bdcb429d91c83c22')
sha256sums_aarch64=('0e59f0a795dab42f2e0257b0ae844a991765ca3f840a3d9fefd78e272eabfba5')

build() {
  cd "${srcdir}/" || exit

  help2man ./${_pkgname} --output "MAN-${pkgver}.1"
}

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "MAN-${pkgver}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
  gzip "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
}
