# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="caps-log"
pkgname="${_pkgname}-bin"
pkgver=1.2.1
pkgrel=1
pkgdesc="A small, terminal-based journaling tool"
arch=('x86_64')
url="https://github.com/NikolaDucak/${_pkgname}"
license=('MIT')
depends=('boost174-libs' 'gcc-libs' 'glibc' 'libgit2')
makedepends=('patchelf')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${url}/raw/${pkgver}/README.md"
        "LICENSE-${pkgver}::${url}/raw/${pkgver}/LICENCE")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/${pkgver}/${_pkgname}-linux.tar.gz")
sha256sums=('782323e0c9ae7954ff0f1c141330de164009845b92713a2ddac004e1ec29bf3e'
            '9fd4f46b0ba1940805ca00a8cb34c60ed94d646a99d3650b69c0a60004990e18')
sha256sums_x86_64=('57b80799e619f6a1c7a22f7929e79a1ff489c0f1554ed7752324b8601a433fab')

build() {
  cd "${srcdir}"
  # patchelf --replace-needed libboost_program_options.so.1.74.0 libboost_program_options.so "${_pkgname}"
  patchelf --replace-needed libgit2.so.1.1 libgit2.so "${_pkgname}"
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}"         "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
