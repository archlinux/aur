#Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>

pkgname=moar-bin
pkgver=1.18.4
pkgrel=1
pkgdesc="A pager designed to just do the right thing without any configuration."
arch=(x86_64)
url='https://github.com/walles/moar'
license=(BSD)
source=("${pkgname%-bin}::${url}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}-linux-386"
        "${pkgname%-bin}-${pkgver}.tar.gz"::"${url}/archive/v${pkgver}.tar.gz")
noextract=(${pkgname%-bin}-${pkgver}.tar.gz)
sha256sums=('7697080fce84712c99f03055f3f762ded0abd0a79e8dccb5f2964bff0d6c08a9'
            '71e5b3e00e047c22b67c2657aa5cd36b19fdc1fac0f03f827212a569d4067810')

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
      install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

}
