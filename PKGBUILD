# Maintainer: robertfoster
# Contributor: Michael J. Pento <mjpento@verizon.net>

pkgname=artifactory-oss
pkgver=7.12.5
pkgrel=1
pkgdesc='Artifactory is an advanced Binary Repository Manager for use by build tools, dependency management tools and build servers'
arch=('any')
url="https://bintray.com/jfrog/product/JFrog-Artifactory-Oss/view"
license=('GPLv3')
depends=('java-runtime-headless' 'net-tools' 'bash')
install="$pkgname.install"
source=("https://releases.jfrog.io/artifactory/bintray-artifactory/org/artifactory/oss/jfrog-artifactory-oss/$pkgver/jfrog-artifactory-oss-$pkgver-linux.tar.gz"
  # "https://releases.jfrog.io/artifactory/bintray-artifactory/org/artifactory/oss/jfrog-artifactory-oss/$pkgver/jfrog-artifactory-oss-$pkgver-sources.tar.gz"
  'artifactory.service'
  'artifactory.conf')
sha256sums=('34dbd0cd94a63f78d3f0fbf21072ebc9939aa4eb3e9eb2d883ff470c6d7c7def'
  '9daada205ad4b201f28f791a04f006aad2ab8885078700d710566d99dc176b3d'
  '7cbc5f68aca3343c2d7445859bcf215150f421dbe36b84c79279abdefb7988de')
options=('!strip')
PKGEXT='.pkg.tar'

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  #patch -Np1 -i ../artifactory.patch
}

package() {
  local artdir="/opt/jfrog/artifactory"

  install -d "$pkgdir$artdir"
  cp -r "$pkgname-$pkgver"/* "$pkgdir$artdir"

  install -Dm644 "$srcdir/artifactory.conf" \
    "$pkgdir/usr/lib/sysusers.d/artifactory.conf"

  install -Dm644 "$srcdir/artifactory.service" \
    "$pkgdir/usr/lib/systemd/system/artifactory.service"
  install -d "$pkgdir$artdir/app/run"
}
