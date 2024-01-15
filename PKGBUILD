# Maintainer: Narthana Epa <narthana.epa@gmail.com>
# Contributor: Brendan MacDonell <macdonellba@gmail.com>
_gitname=ssh-ident
pkgname=ssh-ident-git
pkgver=r70.66a0010
pkgrel=1
pkgdesc="Start ssh-agent and load identities on-demand."
arch=('any')
url="https://github.com/ccontavalli/ssh-ident"
license=('BSD')
depends=(openssh python)
makedepends=(git)
install=ssh-ident.install
source=('git+https://github.com/ccontavalli/ssh-ident.git'
        'ssh-ident.install')
sha1sums=('SKIP'
          '6ce215ed4f976e565d1ceb5d2c302c726e0716d0')

pkgver() {
  cd ${_gitname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_gitname}"
  git revert --no-edit --no-commit ebf8282728211dc4448d50f7e16e546ed03c22d2
  install -D ssh-ident "${pkgdir}/usr/bin/ssh-ident"
  install -m 644 -D LICENSE "${pkgdir}/usr/share/licenses/${_gitname}/LICENSE"
  install -m 644 -D README "${pkgdir}/usr/share/doc/${_gitname}/README"
}
