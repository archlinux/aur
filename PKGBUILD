# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>

pkgname=gothub
pkgver=0.7.0
pkgrel=1
pkgdesc="Command-line app to create and edit releases on GitHub (and upload artifacts), fork of github-release."
arch=('i686' 'x86_64')
url="https://github.com/itchio/${pkgname}"
makedepends=('go')
depends=('glibc')
license=('MIT')
source=("${url}/archive/v${pkgver}.tar.gz"
"Makefile")
sha512sums=('b38756746633419ff9d3e5da506672a5ae78a0f6aebfaf75fc95562d5a044c8e3d2b50cd96e94942ba5b3b6f08c40380093a087df366f59f9d8eb5f677a18f98'
            'a7daf17b750b40db4c1e17aac13de5d76c5de5e197586903a58bf0c094ee7902594fdf44e9e8c75d67386f7773adffefe133743ae70fc3a84ed111f5a37a81e4')

build() {
  cd $srcdir/$pkgname-$pkgver
  cp $srcdir/Makefile .
  GOROOT=/usr/lib/go GOPATH=$HOME/go PATH=$PATH:$GOROOT/bin make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"

  install -Dm755 "${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
