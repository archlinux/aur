# Maintainer: svalo <valo@eigenlab.org>
pkgname=agent-transfer
_pkgsrcname=monkeysphere
pkgver=0.38
pkgrel=1
pkgdesc="Copy a secret key from GnuPG's gpg-agent to OpenSSH's ssh-agent"
arch=('amd64' 'x86_64')
url="http://web.monkeysphere.info/"
license=('GPL3')
depends=('libassuan>=2.0.1' 'libgcrypt>=1.7.0')
source=(http://archive.monkeysphere.info/debian/pool/${_pkgsrcname}/m/${_pkgsrcname}/${_pkgsrcname}_${pkgver}.orig.tar.gz
    agent-transfer.patch
    )

sha256sums=('6951821d11ad646e6e7651d677bfab8f800fbc52703a0ab9942d03cd13959073'
            '67d756429f0805c9980d61d2ffac69be56906367e90419f3395a0b8bfca39a95')

prepare() {
  cd "$srcdir/$_pkgsrcname-$pkgver"
  patch -Ni "${srcdir}/agent-transfer.patch"

}

build() {
  cd "$srcdir/$_pkgsrcname-$pkgver"
  make DESTDIR="$pkgdir/" all
}

package() {
  cd "$srcdir/$_pkgsrcname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
