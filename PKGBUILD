# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=natecraddock
_pkgname=zf
pkgname=${_pkgname}-bin
pkgver=0.10.0
pkgrel=2
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
        "CHANGELOG-${pkgver}::${_urlraw}/CHANGELOG.md"
        "ZF-${pkgver}::${_urlraw}/doc/${_pkgname}.md"
        "MAN-${pkgver}.1::${_urlraw}/doc/${_pkgname}.1"
        "${_pkgname}-${pkgver}.bash::${_urlraw}/complete/${_pkgname}"
        "${_pkgname}-${pkgver}.zsh::${_urlraw}/complete/_${_pkgname}"
        "${_pkgname}-${pkgver}.fish::${_urlraw}/complete/${_pkgname}.fish")
source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-${arch[0]}-linux.tar.xz")
source_aarch64=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-${arch[1]}-linux.tar.xz")
sha256sums=('28cc086b5786113ea2b710c1976ba14b0fcf82eaa25e504f4b77be4e1e386fea'
            'ec3ee7f38a4d5b32d7af6303c6749d79ed8ca352f0e6bb81216a75ca9ce0ff2c'
            '4e2756564939bba4d88a43b54dbc86815e884dcab53755e3fcd9d9613f6a2d00'
            'dc08af8dc9c117b19d6fb448903a4a8f2fc1e16fe2c66b0caa7a93f98ef607b9'
            '8d8baca49506d34d93162e6d038e71e0c4295cdaa2598ae162adf0711c894e61'
            '0b6ae96deaa67af93232c67b907744a8017c5dab75f415f9b122614f2e2d3504'
            'ed8f12c466300fc199740e07811afd0665c7977070b7cd9d0860033672bf4112'
            'b1275ea83fbc62507dfc96695d9455633a8b33fa879599975b52c2848b835a47')
sha256sums_x86_64=('4c1f9f9e2ccfb3e35a14d4448047288386ebca383c1e33a44400ab0fc1ee3cc9')
sha256sums_aarch64=('c41f6975a5f2fe85ea03a88ea4b142807d1d00cd768b736e4a78b6d6961696ee')

package() {
  cd "$srcdir/"

  install -Dm755 "${_pkgname}-${pkgver}-${CARCH}-linux" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "CHANGELOG-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
  install -Dm644 "ZF-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/ZF.md"

  install -Dm644 "MAN-${pkgver}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
  gzip "${pkgdir}/usr/share/man/man1/${_pkgname}.1"

  install -Dm644 ${_pkgname}-${pkgver}.bash "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -Dm644 ${_pkgname}-${pkgver}.zsh "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
  install -Dm644 ${_pkgname}-${pkgver}.fish "${pkgdir}/usr/share/fish/completions/${_pkgname}.fish"
}
