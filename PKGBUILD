# Maintainer: mikezackles@gmail.com
# Contributor: Michael J. Pento <mjpento@verizon.net>

pkgname=artifactory-cpp-ce
pkgver=6.16.0
pkgrel=1
pkgdesc='Artifactory is an advanced Binary Repository Manager for use by build tools, dependency management tools and build servers'
arch=('any')
url="https://bintray.com/jfrog/product/JFrog-Artifactory-Cpp-CE/view"
license=('GPLv3')
depends=('java-runtime-headless' 'net-tools' 'bash')
conflicts=('artifactory-oss')
install="$pkgname.install"
source=("jfrog-artifactory-cpp-ce-${pkgver}.zip::https://bintray.com/api/ui/download/jfrog/artifactory/jfrog-artifactory-cpp-ce-${pkgver}.zip"
        'artifactory.service'
        'artifactory.conf'
        'artifactory.default')
sha256sums=('df28f01a3615cb12d556a255f49f36892e4db23133c63049a230aa6f41bd6372'
            'SKIP'
            'SKIP'
            'SKIP')
options=('!strip')
PKGEXT='.pkg.tar'

package() {
  local artdir="/opt/artifactory"

  pushd "$pkgname-$pkgver"
  rm -f bin/*.{exe,bat}
  rm -f bin/{install,uninstall}Service.sh
  rm -f bin/artifactoryctl
  rm -f tomcat/bin/*.bat
  rm -f COPYING* *.txt *.html
  popd

  install -d "$pkgdir$artdir"
  cp -r "$pkgname-$pkgver"/* "$pkgdir$artdir"
  install -Dm644 "$srcdir/artifactory.conf" "$pkgdir/usr/lib/sysusers.d/artifactory.conf"
  install -Dm644 "$srcdir/artifactory.default" "$pkgdir$artdir/bin"
  install -Dm644 "$srcdir/artifactory.service" "$pkgdir/usr/lib/systemd/system/artifactory.service"
  install -d "$pkgdir$artdir/run"
}
