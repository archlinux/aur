# Maintainer: Moritz Patelscheck <moritz(at)patelscheck.de>

pkgname=otpw
pkgver=1.5
pkgrel=1
pkgdesc="A one-time password login package using PAM"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.cl.cam.ac.uk/~mgk25/otpw.html"
license=('custom')
depends=('pam')
source=("http://www.cl.cam.ac.uk/~mgk25/download/$pkgname-$pkgver.tar.gz"
        "LICENSE")
sha1sums=('99bb4094514617ba5ea11aa26a89977390b6358d'
          'e6572dd6ef26883120850ec009a7d40df62a2d2d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make CFLAGS="$CFLAGS -fPIC"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm0755 "pam_otpw.so" "$pkgdir/usr/lib/security/pam_otpw.so"
  install -Dm0755 "otpw-gen"    "$pkgdir/usr/bin/otpw-gen"

  cd "${srcdir}"
  install -Dm0644 "LICENSE"     "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2:sw=2:et
