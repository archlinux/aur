#Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>

pkgname=moar-bin
pkgver=1.15.3
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
sha256sums=('c05b8b7acf19dea094331322c41db551569a7297e26ca3d17a46781d69628744'
            '9cbfd11cc128052c66dde381d77b2c4bfb1260feb1e0a0d23119844b274fe659')

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
