pkgname=ipfs-rainbow
_pkgname=rainbow
pkgver=1.21.0
pkgrel=1
pkgdesc="ipfs-rainbow"
url="https://github.com/ipfs/${_pkgname}"
arch=('x86_64' 'aarch64')
license=('MIT AND Apache-2.0')
makedepends=('go')
conflicts=("${pkgname}-bin" "${pkgname}-git")
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.service"
	"${pkgname}.confd")
b2sums=('1bdf64e1d374b64ab51c40b7c55d4c7ed729cd967cf9746e777109839444c7c9d8246243d63ba28c0854a5d0308b85a7e9c4479403775966d86ad4b4d5288da0'
        'c816fac82e1e21a0e2d6f8c9c8e23b95939bff52d4b272c9ccbf3aa93160e555989258ae6d2547feaf41f4a1bb0d7b0ea017ff4f00e1d1c1671c59d3b1d1e789'
        '4c46d5c22e470862c7d28b98578b35333889e0b5536ae7a06d9b8036278e436e85a7961f7e6cea7863be7e5f21ea1aebb79de6ebc753e49b6c194ddd04759cdb')

build() {
  cd "${_pkgname}-${pkgver}"
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  go build -o $srcdir/ipfs-rainbow
}

package() {
  cd "${_pkgname}-${pkgver}"
  install -Dm 755 $srcdir/$pkgname ${pkgdir}/usr/bin/${pkgname}
  install -o root -g root -m644 -D $srcdir/${pkgname}.service $pkgdir/usr/lib/systemd/system/${pkgname}.service
  install -o root -g root -m644 -D $srcdir/${pkgname}.confd $pkgdir/etc/conf.d/$pkgname
}
