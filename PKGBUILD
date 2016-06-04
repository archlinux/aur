# Maintainer: Daniel Maslowski <info@orangecms.org>
pkgname=fisherman-git
_gitname=fisherman
pkgver=2.10.0.r1.gf7bd2b1
pkgrel=1
pkgdesc="A blazing fast, modern plugin manager for fish"
arch=('any')
url="http://fisherman.sh/"
license=('MIT')
depends=('fish' 'git')
optdepends=()
makedepends=('git')
conflicts=('fisherman')
install=fisherman-git.install
source=("git+https://github.com/fisherman/fisherman.git")
sha512sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  sharepath="${pkgdir}/usr/share"
  fishpath="${sharepath}/fish"
  # install Fisherman in the global fish directory
  cd "${_gitname}"
  install -Dm 644 fisher.fish "${fishpath}/functions/fisher.fish"
  # README and LICENSE
  install -Dm 644 LICENSE "${sharepath}/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${sharepath}/doc/${pkgname}/README"
}
