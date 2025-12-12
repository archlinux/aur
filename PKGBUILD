# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=natecraddock
_pkgname=zf
pkgname=${_pkgname}-bin
pkgver=0.10.2
pkgrel=1
pkgdesc='A commandline fuzzy finder designed for filtering filepaths'
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
            'e203862ec4ff38c56e60533ee2d9cc40d69f793d4b2a978c76591a50c762b472'
            '9f542f560c195d795fa5737109dcf30a5b61be7e052d2813dc1b3debac5640bb'
            'dc08af8dc9c117b19d6fb448903a4a8f2fc1e16fe2c66b0caa7a93f98ef607b9'
            '98c640c3286fbb2436be98472879c765c1903e34c969d58866fbe569fac99c7b'
            '0b6ae96deaa67af93232c67b907744a8017c5dab75f415f9b122614f2e2d3504'
            'ed8f12c466300fc199740e07811afd0665c7977070b7cd9d0860033672bf4112'
            'b1275ea83fbc62507dfc96695d9455633a8b33fa879599975b52c2848b835a47')
sha256sums_x86_64=('7287c1255d5617069c0463cbcab910a1c39d1047a1a0baea9016e7d9d29c63be')
sha256sums_aarch64=('69ad2aec6b003d53b5ed60b8e7e0727491ba96716d770a06a9fd2d7ca6b3654c')

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
