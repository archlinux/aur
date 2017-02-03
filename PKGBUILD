# Maintainer:Stefan Husmann <stefan-husmann@t-online.de>

pkgname=bzr-bzr
pkgver=2.8.0.6621
pkgrel=2
pkgdesc="A decentralized revision control system (bazaar) from launchpad"
arch=('i686' 'x86_64')
url="https://bazaar.canonical.com/"
license=('GPL')
depends=('python2')
optdepends=('python2-paramiko: SFTP support')
makedepends=('bzr' 'pyrex')
provides=('bzr')
conflicts=('bzr')
source=('bazaar-2.8::bzr+https+urllib://code.launchpad.net/~bzr-pqm/bzr/bzr.dev/')
md5sums=('SKIP')

pkgver() {
  cd bazaar-2.8
  printf "2.8.0.%s" "$(bzr revno)"
}

prepare() {
  cd bazaar-2.8
  sed 's|/man/man1|/share/man/man1|' -i setup.py
}

build() {
  cd bazaar-2.8
  python2 setup.py build
}

package() {
  cd bazaar-2.8
  python2 setup.py install --prefix='/usr' --root="${pkgdir}" --optimize='1'
  install -dm 755 "${pkgdir}"/usr/share/bash-completion/completions
  install -m 644 contrib/bash/bzr "${pkgdir}"/usr/share/bash-completion/completions/
}
