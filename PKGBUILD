#Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>

pkgname=moar-bin
pkgver=1.15.4
pkgrel=1
pkgdesc="A pager designed to just do the right thing without any configuration."
arch=(x86_64)
url='https://github.com/walles/moar'
license=(BSD)
optdepends=("highlight: source code syntax highlighter")
conflicts=(moar)
provides=(moar)
source=("${pkgname%-bin}::${url}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}-linux-386"
        "${pkgname%-bin}-${pkgver}.tar.gz"::"${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=(${pkgname%-bin}-${pkgver}.tar.gz)
sha256sums=('4dd49b9a5c14427230804b6e532c19de8c7f367c5fe4828bbe6202b4d5528002'
            'ad63e3f8ae048700d54d9bdbeb5408c5e9f9708e0979e6c9f6cb43139727aa7f')

prepare() {

   bsdtar -xvf ${pkgname%-bin}-${pkgver}.tar.gz \
   ${pkgname%-bin}-${pkgver}/LICENSE \
   ${pkgname%-bin}-${pkgver}/${pkgname%-bin}.1 \
   ${pkgname%-bin}-${pkgver}/README.md

}

package() {

   cd "${srcdir}"
      install -Dm755 ${pkgname%-bin} "${pkgdir}/usr/bin/${pkgname%-bin}"

   cd "${srcdir}/${pkgname%-bin}-${pkgver}"
      install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
      install -Dm644 ${pkgname%-bin}.1 "${pkgdir}/usr/share/man/man1/${pkgname%-bin}.1"
      install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname%-bin}/README.md"

}
