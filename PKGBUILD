#Maintainer: Christian Rebischke <echo Q2hyaXMuUmViaXNjaGtlQGdtYWlsLmNvbQo= | base64 -d>

pkgname=viper-framework-git
provides=viper-framework
conflicts=viper-framework
pkgver=1.2.633.e35789e
pkgrel=1
pkgdesc="Git version of Viper the Binary Analysis Framework"
arch=("any")
url=("https://github.com/botherder/viper")
license=("BSD")
depends=(
"python2-pyexiftool" "python2-pylzma" "python2-bottle" "python2-pyelftools" 
"python2-bitstring" "python2-dnspython" "python2-m2crypto" "python2-pyasn1" 
"python2-requests" "python2-sqlalchemy" "python2-prettytable" "python2-magic" 
"python2-pydeep" "ssdeep" "python2-ssdeep" "python2-beautifulsoup4" 
"python2-pefile" "python2-crypto" "python2-olefile" "python2-oletools") 
makedepends=("git")
source=("git+https://github.com/botherder/viper"
        "viper-framework.install")
sha512sums=(
"SKIP"
"5f2446433205c4b04b7a2aad4c2262dfd54dc25a034a1b94f8de45a37a164c3fccdebdda60446148ddb940a5f84257426cbda21b7815d1e7b3cea5e9af54c0fe")
install="viper-framework.install"
pkgver() {
  cd viper
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd viper
  python2 -m compileall .
  python2 -O -m compileall .
}

package() {
  cd "$srcdir/viper"
  mkdir -p "$pkgdir/opt/viper/"
  mv * "$pkgdir/opt/viper/"
}
