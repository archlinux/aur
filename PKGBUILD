# Maintainer: Chakib Benziane <contact@sp4ke.xyz>

_pkgname='SSLproxy'
pkgname=sslproxy-git
pkgver=v0.9.3_0_ge456f56
pkgrel=1
pkgdesc='Transparent SSL/TLS proxy for decrypting and diverting network traffic to other programs, such as UTM services, for deep SSL inspection'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/sonertari/SSLproxy'
license=('BSD')
depends=('openssl')
makedepends=(
  'git'
  'libnet'
)
conflicts=('sslproxy')
provides=('sslproxy')
source=(
    git+https://github.com/sonertari/SSLproxy#branch=master
)
sha512sums=(
    'SKIP'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --tags --long | sed s/-/_/g
}


build() {
  cd ${srcdir}/${_pkgname}
  make
}

package() {
  cd $_pkgname || exit 1
  make install DESTDIR="$pkgdir" PREFIX=/usr
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 LICENSE.contrib "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.contrib"
  install -Dm644 LICENSE.third "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.third"
}

# vim: ts=2 sw=2 et:
