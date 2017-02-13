# Maintainer: Yegorius <yegorius@domic.us>

pkgname=artifactory-oss
pkgver=5.0.1
pkgrel=1
pkgdesc='Artifactory is an advanced Binary Repository Manager for use by build tools, dependency management tools and build servers'
arch=('any')
url="https://bintray.com/jfrog/product/JFrog-Artifactory-Oss/view"
license=('GPLv3')
depends=('java-runtime-headless' 'net-tools' 'bash')
install="$pkgname.install"
source=("jfrog-artifactory-oss-${pkgver}.zip::https://bintray.com/jfrog/artifactory/download_file?file_path=jfrog-artifactory-oss-${pkgver}.zip"
        'artifactory.service'
        'artifactory.default')
sha256sums=('9bb0467e7e4cf5b58b0f35abdfd7f13bcbe652a9b06266ebf3de6daedb0665a5'
            '8ba1287f4d062f57a5cf9e5426d4affcfcc00ca2680cd603f41c603957a42c20'
            '54617cc75624db3a03dbed62898b2f438cb8145983a034d72f12ca259c8218a4')
options=('!strip')
PKGEXT='.pkg.tar'

package() {
  local artDist="/opt/artifactory"
  
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
