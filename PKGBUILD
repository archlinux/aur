# Maintainer: diaowinner <diaowinner@gmail.com>
# Maintainer: KreativeKorp <support@kreativekorp.com>

pkgname=ttf-open-relay
pkgver=r85.3326b93
pkgrel=1
epoch=1
pkgdesc="Latest snapshot of Open Relay, Free and open source fonts from Kreative Software, containing Constructium, Fairfax (HD), Kreative Square."
url="http://www.kreativekorp.com/software/fonts/index.shtml"
arch=(any)
license=(custom:OFL-1.1)
makedepends=("git")
source=("${pkgname}::git+https://github.com/kreativekorp/open-relay.git#branch=master")
sha256sums=("SKIP")

pkgver() {
  cd $pkgname
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}
  
package() {
  mkdir -p $pkgdir/usr/share/fonts/TTF
  find $pkgname/ -name "*.ttf" -exec install -Dm644 {} $pkgdir/usr/share/fonts/TTF  \;
  install -Dm644 $pkgname/Fairfax/OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # There"s no Reserved Font Name contained luckily, so every OFL is OK.
}
