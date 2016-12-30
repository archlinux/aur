# Maintainer:Stefan Husmann <stefan-husmann@t-online.de>

pkgname=bzr-bzr
pkgver=1
pkgrel=1
pkgdesc="A decentralized revision control system (bazaar) from launchpad"
arch=('i686' 'x86_64')
url="https://bazaar.canonical.com/"
license=('GPL')
depends=('python2')
optdepends=('python2-paramiko: SFTP support')
makedepends=('bzr')
provides=('bzr')
conflicts=('bzr')
source=('bazaar::bzr+https+urllib://code.launchpad.net/~bzr-pqm/bzr/bzr.dev/')
md5sums=('SKIP')

prepare() {
  cd bazaar

  sed 's|man/man1|share/man/man1|' -i setup.py
  sed 's|/usr/bin/env python|/usr/bin/env python2|' -i bzrlib/{plugins/bash_completion/bashcomp.py,tests/ssl_certs/create_ssls.py,patiencediff.py,_patiencediff_py.py}
}


pkgver() {
  cd bazaar
  bzr revno
}

build() {
  cd bazaar
  python2 setup.py build
}

package() {
  cd bazaar
  python2 setup.py install --prefix='/usr' --root="${pkgdir}" --optimize='1'
  install -dm 755 "${pkgdir}"/usr/share/bash-completion/completions
  install -m 644 contrib/bash/bzr "${pkgdir}"/usr/share/bash-completion/completions/
}
