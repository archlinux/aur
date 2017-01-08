pkgname=pwauth
pkgver=2.3.11
pkgrel=6
pkgdesc="An authenticator designed to be used for web authentication"
url="https://github.com/phokz/pwauth/tree/master/pwauth"
arch=('x86_64' 'i686')
depends=('pam')
license=('BSD')
install='pwauth.install'

source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/$pkgname/$pkgname-$pkgver.tar.gz"
        "pwauth.install"
        "http_uid.patch"
        "makefile.patch"
        "pwauth"
        "LICENSE")
md5sums=('2b7812724653bb0d238c1e0dfd5affdf'
         'be1bdc32c7f3b8fce10ff23bb0731326'
         'f0bc2063fb68f2b2c59f103e10c6ba20'
         '6db798700fd9f1bb1ed3b66b7924b1f2'
         'f4d1219470c9225a2693371a8dcbb480'
         'ba32eb75e91477479ae6eba0bb5c40d0')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/http_uid.patch"
  patch -Np0 -i "${srcdir}/makefile.patch"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D -m4755 pwauth "${pkgdir}/usr/bin/pwauth"
  install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 "${srcdir}/pwauth" "${pkgdir}/etc/pam.d/pwauth"
}

# vim:set ts=2 sw=2 et:
