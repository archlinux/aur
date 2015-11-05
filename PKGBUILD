pkgname=pwauth
pkgver=2.3.11
pkgrel=4
pkgdesc="An authenticator designed to be used for web authentication"
url="http://code.google.com/p/pwauth/"
arch=('x86_64' 'i686')
license=('BSD')
install='pwauth.install'
source=("http://pwauth.googlecode.com/files/$pkgname-$pkgver.tar.gz"
        "pwauth.install"
        "http_uid.patch"
        "LICENSE")
md5sums=('2b7812724653bb0d238c1e0dfd5affdf'
         'be1bdc32c7f3b8fce10ff23bb0731326'
         '850e3b228c00102bc88ef56722520bf9'
         'ba32eb75e91477479ae6eba0bb5c40d0')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/http_uid.patch"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D -m4755 pwauth "${pkgdir}/usr/bin/pwauth"
  install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
