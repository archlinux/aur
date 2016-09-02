# Maintainer: svalo <valo@eigenlab.org>
pkgname=agent-transfer
_pkgsrcname=monkeysphere
pkgver=0.39
pkgrel=1
pkgdesc="Copy a secret key from GnuPG's gpg-agent to OpenSSH's ssh-agent"
arch=('i686' 'x86_64')
url="http://web.monkeysphere.info/"
license=('GPL3')
depends=('libassuan>=2.0.1' 'libgcrypt>=1.7.0')
source=(http://archive.monkeysphere.info/debian/pool/${_pkgsrcname}/m/${_pkgsrcname}/${_pkgsrcname}_${pkgver}.orig.tar.gz
    agent-transfer.patch
    )

sha256sums=('73331e2df361b22e1dc6445a7d2b0b2c5a124daa4d850c2ecce721579592c29f'
            '2679c03daf13c494d3672091b2f351429618ad96f505571784fe3485727d93e3')

prepare() {
  cd "${srcdir}/${_pkgsrcname}-${pkgver}"
  patch -Ni "${srcdir}/agent-transfer.patch"

}

build() {
  cd "${srcdir}/${_pkgsrcname}-${pkgver}"
  make all
}

package() {
  cd "${srcdir}/${_pkgsrcname}-${pkgver}"

  make DESTDIR="${pkgdir}/" install
}
