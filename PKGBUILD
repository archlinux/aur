# Maintainer: Yegorius <yegorius@domic.us>

pkgname=artifactory-oss
pkgver=4.8.0
pkgrel=1
pkgdesc='Artifactory is an advanced Binary Repository Manager for use by build tools, dependency management tools and build servers'
arch=('any')
url="http://artifactory.jfrog.org/artifactory-distribution-parent/jfrog-artifactory-oss/"
license=('GPLv3')
depends=('java-runtime-headless' 'net-tools' 'bash')
install="$pkgname.install"
source=("jfrog-artifactory-oss-${pkgver}.zip::https://bintray.com/jfrog/artifactory/download_file?file_path=jfrog-artifactory-oss-${pkgver}.zip"
        'artifactory.service'
        'artifactory.default')
sha256sums=('2de13962ad1e6f4f1537e1fd86b6e70da6afae67a2449bf0cb369d3a84267647'
            '8ba1287f4d062f57a5cf9e5426d4affcfcc00ca2680cd603f41c603957a42c20'
            '2b0ec5f2940498bfe72ecae5b66cd5ea5743df71ac0bf766fc7363bebf158883')
options=('!strip')
PKGEXT='.pkg.tar'

package() {
  artDist="/opt/artifactory"
  
  pushd "$pkgname-$pkgver"
  rm -f bin/*.{exe,bat}
  rm -f bin/{install,uninstall}Service.sh
  rm -f bin/artifactoryctl
  rm -f tomcat/bin/*.bat
  rm -f COPYING* *.txt *.html
  popd
  
  install -d "$pkgdir$artDist"
  cp -r "$pkgname-$pkgver"/* "$pkgdir$artDist"
  install -Dm755 "$srcdir/artifactory.default" "$pkgdir$artDist/bin"
  install -Dm755 "$srcdir/artifactory.service" "$pkgdir/usr/lib/systemd/system/artifactory.service"
  install -d "$pkgdir/opt/artifactory/run"
}
