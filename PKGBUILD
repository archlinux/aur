# Maintainer: Vlad Glagolev <scm(at)vaygr(dot)net>

pkgname=dmoji
pkgver=0.4
pkgrel=1
pkgdesc="emoji selector program"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('icu' 'dmenu' 'xsel')
optdepends=('rofi: to use rofi instead of dmenu')
url="https://github.com/cedricbu/dmoji"

source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
        "https://github.com/cedricbu/dmoji/commit/b194a4e7bf4afabe87673a37ab18e49cc056fd1f.patch"
        "dprintf.patch"
        "makefile.patch")
sha256sums=('100cff00e1b2f10d93e3f44a13648712d49450d1928dd91d09fdeeea2238c8cf'
            '165d9ca068a0d596e19de55e13b377c7a92acaa30436a8b5672fc0ff0fbe69e0'
            '6482936f51a8ae0c787b82a29a1bb4c46675a58211969b33a631dbb417422b7a'
            'a3da07a303bfdec8542b1bf88860cfddf34ac7672533d615e29608f9ff47ac6c')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -p1 < ../b194a4e7bf4afabe87673a37ab18e49cc056fd1f.patch
  patch -p0 < ../dprintf.patch
  patch -p0 < ../makefile.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make PREFIX="${pkgdir}/usr/" install

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
