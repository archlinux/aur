#Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>

pkgname=moar-bin
pkgver=1.18.2
pkgrel=1
pkgdesc="A pager designed to just do the right thing without any configuration."
arch=(x86_64)
url='https://github.com/walles/moar'
license=(BSD)
source=("${pkgname%-bin}::${url}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}-linux-386"
        "${pkgname%-bin}-${pkgver}.tar.gz"::"${url}/archive/v${pkgver}.tar.gz")
noextract=(${pkgname%-bin}-${pkgver}.tar.gz)
sha256sums=('a9c38ef19bfac7da0f3508d9b88fcfe49a27cc5b9039d69a14fb829e33d093b8'
            'eb1d63f9fc5ddcc493bf03622572499ecdcac9f9da81b5be2e9ab3740310de9b')

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
