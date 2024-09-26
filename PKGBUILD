# Maintainer: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>
# Co-Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=sachaos
_pkgname=viddy
pkgname=${_pkgname}-bin
pkgver=1.1.3
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
            '17341d78f1cd1a5bcd9df47f81f6f6eabd44a3a3226376261d2395c2880eebcd')
sha256sums_x86_64=('42358f7842f707c7b4369ade766345d145d3b8d1a77032d02b62d7dfcbeef49e')
sha256sums_i686=('2b44eda26b41e6ca56cf2995160a256e81d036922e45bc80a0cef245ac0ba773')
sha256sums_aarch64=('531ad5368e26bbea1eec7ace4224933a032bdccba91ac0b024d521c50272775b')

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
