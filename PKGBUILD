# Maintainer: Jakob Helmecke <j dot helmecke at gmail dot com>

pkgname=zsh-hist-git
_pkgname=${pkgname::-4}
pkgver=r55.42cd5c2
pkgrel=2
pkgdesc="Edit your Zsh history, without ever leaving the command line."
arch=('any')
url="https://github.com/marlonrichert/zsh-hist.git"
license=('MIT')
depends=('zsh')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/marlonrichert/zsh-hist.git")
sha256sums=('SKIP')

pkgver() {
  cd zsh-hist
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd zsh-hist
  install -vDm 644 ${_pkgname}.plugin.zsh \
    -t "${pkgdir}/usr/share/zsh/plugins/${_pkgname}/"
  for f in {functions/.hist.*,functions/*}; do
    install -vDm 644 "$f" \
      -t "${pkgdir}/usr/share/zsh/plugins/${_pkgname}/functions/" 
  done
  # docs
  install -vDm 644 README.md \
    -t "${pkgdir}/usr/share/doc/${_pkgname}/"
  # license
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}/"
}
