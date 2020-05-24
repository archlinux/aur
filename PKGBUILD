# Maintainer: Senya <senya at riseup.net>
pkgname=crowdin-cli
pkgver=3.1.13.r3.g0911157
pkgrel=1
pkgdesc="Command line tool that allows you to manage and synchronize localization resources with your Crowdin project"
url="https://support.crowdin.com/cli-tool/"
license=('MIT')
depends=('java-runtime>=8')
makedepends=('git' 'java-environment>=8' 'gradle')
conflicts=('crowdin-cli-bin')
arch=('any')
md5sums=('SKIP')

source=(
  'git+https://github.com/crowdin/crowdin-cli.git#branch=cli3'
)

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  gradle buildCrowdinCliJar
}

package()
{
  cd "$srcdir"
  install -Dm 0644 "$srcdir/$pkgname"/build/libs/crowdin-cli-*.jar "$pkgdir"/usr/share/java/$pkgname/crowdin-cli.jar
  install -Dm 0755 "$startdir"/crowdin "$pkgdir"/usr/bin/crowdin
}

