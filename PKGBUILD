# Maintainer: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>
# Co-Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=sachaos
_pkgname=viddy
pkgname=${_pkgname}-bin
pkgver=1.1.5
pkgrel=1
pkgdesc='A modern watch command, binary version'
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
            'b93dc7b89de815da67b9b574b2fe1762aa1fd9d4c3ee98b1092fc67e20a9f3e8')
sha256sums_x86_64=('324e41364aaa3165f501c9e726ce23075054b2ac9df398bd9a35b5c7133792ff')
sha256sums_i686=('c85c381782c4bb9bf66eca888a6fbb641a9e65da98e9ff689c725dfdb6847b34')
sha256sums_aarch64=('6bae1c7d4d05417f8911c58f5e4f547237cf5f9b7520524ce9730a34e0cf87bf')

build() {
  help2man ./${_pkgname} --output "MAN-${pkgver}.1"
}

package() {
  cd "$srcdir/"

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"

  install -Dm644 "MAN-${pkgver}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
  gzip "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
}
