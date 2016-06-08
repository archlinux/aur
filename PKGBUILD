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
            'a085978124b04a3576f6c670e3dee65b836298cb8bcb756dac6dd03f97954483'
            'fa0bb817062ab6aac4c2a5f1e9f93887823a21e3c41e24bc77e9a521355eefc5')
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
  install -d "$pkgdir/run/artifactory"
}
