# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=natecraddock
_pkgname=zf
pkgname=${_pkgname}-bin
pkgver=0.10.0
pkgrel=1
pkgdesc='a commandline fuzzy finder designed for filtering filepaths'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${pkgver}"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('glibc')
makedepends=('tar')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}::${_urlraw}/README.md"
        "CHANGELOG-${pkgver}::${_urlraw}/CHANGELOG.md")
source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-${arch[0]}-linux.tar.xz")
source_aarch64=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-${arch[1]}-linux.tar.xz")
sha256sums=('28cc086b5786113ea2b710c1976ba14b0fcf82eaa25e504f4b77be4e1e386fea'
            'ec3ee7f38a4d5b32d7af6303c6749d79ed8ca352f0e6bb81216a75ca9ce0ff2c'
            '4e2756564939bba4d88a43b54dbc86815e884dcab53755e3fcd9d9613f6a2d00')
sha256sums_x86_64=('4c1f9f9e2ccfb3e35a14d4448047288386ebca383c1e33a44400ab0fc1ee3cc9')
sha256sums_aarch64=('c41f6975a5f2fe85ea03a88ea4b142807d1d00cd768b736e4a78b6d6961696ee')

build() {
  mv ./${_pkgname}-${pkgver}-${CARCH}-linux ./${_pkgname}
}

package() {
  cd "$srcdir/"

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "CHANGELOG-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
