# Maintainer: Michael J. Pento <mjpento@verizon.net>

pkgname=artifactory-oss
pkgver=6.16.0
pkgrel=1
pkgdesc='Artifactory is an advanced Binary Repository Manager for use by build tools, dependency management tools and build servers'
arch=('any')
url="https://bintray.com/jfrog/product/JFrog-Artifactory-Oss/view"
license=('GPLv3')
depends=('java-runtime-headless' 'net-tools' 'bash')
install="$pkgname.install"
source=("jfrog-artifactory-oss-${pkgver}.zip::https://bintray.com/jfrog/artifactory/download_file?file_path=jfrog-artifactory-oss-${pkgver}.zip"
        'artifactory.service'
        'artifactory.conf'
        'artifactory.default')
sha256sums=('874f04242cbc0be3027d2da907bd04a0845f197ef0b78a9972f741d438f0b580'
            '8ba1287f4d062f57a5cf9e5426d4affcfcc00ca2680cd603f41c603957a42c20'
            '48bc1cddf9fa64f0d62a519470a490719398d67b6baeef6a3e647b737d6484df'
            '34337e72bbdca63a3244a61d3d1aad324c473782d976da68b72ff72ed38ac5e5')
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
