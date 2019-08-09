# Maintainer: svalo <valo@eigenlab.org>
pkgname=agent-transfer
_pkgsrcname=monkeysphere
pkgver=0.44
pkgrel=1
pkgdesc="Copy a secret key from GnuPG's gpg-agent to OpenSSH's ssh-agent"
arch=('i686' 'x86_64')
url="http://web.monkeysphere.info/"
license=('GPL3')
depends=('libassuan>=2.0.1' 'libgcrypt>=1.7.0')
source=(https://archive.monkeysphere.info/debian/pool/${_pkgsrcname}/m/${_pkgsrcname}/${_pkgsrcname}_${pkgver}.orig.tar.gz
    agent-transfer.patch
    )

sha256sums=('6ac6979fa1a4a0332cbea39e408b9f981452d092ff2b14ed3549be94918707aa'
            'bce1ef58a6e2c01655501f2f15e326cf851bb909029e8431b963f4cd939e8648')

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
