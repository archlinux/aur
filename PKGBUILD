# Maintainer: Yegorius <yegorius@domic.us>

pkgname=artifactory-oss
pkgver=5.11.0
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
sha256sums=('8b00705d5ce6b8321fd1a623a80cea24fbf2fd8545672c72778e7c918405b6dc'
            '5ffe6fc1cfd8b52276cfa8c191c90526f79ad0d000d893e7acb7d30f9004601b'
            '48bc1cddf9fa64f0d62a519470a490719398d67b6baeef6a3e647b737d6484df'
            '1ce98bff3733c965889cd851c43a7f993161fbb9001b79dcd3ea17a29c380129')
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
