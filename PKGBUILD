#Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>

pkgname=moar-bin
pkgver=1.16.0
pkgrel=1
pkgdesc="A pager designed to just do the right thing without any configuration."
arch=(x86_64)
url='https://github.com/walles/moar'
license=(BSD)
optdepends=("highlight: source code syntax highlighter")
conflicts=(moar)
provides=(moar)
source=("${pkgname%-bin}::${url}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}-linux-386"
        "${pkgname%-bin}-${pkgver}.tar.gz"::"${url}/archive/v${pkgver}.tar.gz")
noextract=(${pkgname%-bin}-${pkgver}.tar.gz)
sha256sums=('7c2320ea9b1bd95c935a076dbd4cb248fedc10a92b20b84ce42549eab5cea463'
            '39142047aee50f3823bd3223d28ba8133c202deca2c0689402a4606d74c63251')

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
      install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
      install -Dm644 ${pkgname%-bin}.1 "${pkgdir}/usr/share/man/man1/${pkgname%-bin}.1"
      install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname%-bin}/README.md"

}
