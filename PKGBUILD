# Maintainer: svalo <valo@eigenlab.org>
pkgname=agent-transfer
_pkgsrcname=monkeysphere
pkgver=0.41
pkgrel=1
pkgdesc="Copy a secret key from GnuPG's gpg-agent to OpenSSH's ssh-agent"
arch=('i686' 'x86_64')
url="http://web.monkeysphere.info/"
license=('GPL3')
depends=('libassuan>=2.0.1' 'libgcrypt>=1.7.0')
source=(http://archive.monkeysphere.info/debian/pool/${_pkgsrcname}/m/${_pkgsrcname}/${_pkgsrcname}_${pkgver}.orig.tar.gz
    agent-transfer.patch
    )

sha256sums=('911a2f1622ddb81151b0f41cf569ccf2154d10a09b2f446dbe98fac7279fe74b'
            '7209c99d3f11bfdd6484012e989c296d3f484b6f1f7e37ae65bd54b4c3873673')

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
