# Maintainer: Dario Pellegrini <pellegrini dot dario at gmail dot com>

pkgname=bfg-git
_gitname=bfg-repo-cleaner
pkgver=r465.aeee9e3
pkgrel=1
pkgdesc='Removes large blobs like git-filter-branch does, but faster.'
url='https://github.com/rtyley/bfg-repo-cleaner'
arch=('any')
license=('GPL3')
depends=('java-runtime>8' 'bash')
makedepends=('sbt')
conficts=('bfg')
source=("git+https://github.com/rtyley/bfg-repo-cleaner.git"
        "bfg.sh")
sha256sums=('SKIP'
            'a41ad8ff48364c1118e69f5c1c6c5c070d56ad1d2f9cd09bca3c095385a6b530')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_gitname"
  sbt "bfg/assembly"
}

package() {
  install -DT -m755 "${srcdir}/bfg.sh" "${pkgdir}/usr/bin/bfg"
  install -DT -m644 "$(find . -name 'bfg*.jar')" "${pkgdir}/usr/share/java/bfg/bfg.jar"
}
