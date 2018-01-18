# Maintainer:  Michael Stergianis <michaelstergianis at gmail dot com>
pkgname=google-java-format-git
pkgdesc="Reformats Java source code to comply with Google Java Style"
pkgrel=1
pkgver=r417.1dde65f
arch=('any')
url="https://github.com/google/google-java-format"
license=('Apache')
makedepends=('git' 'maven')
depends=('java-runtime')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=()
source=("google-java-format-git::git+https://github.com/google/google-java-format"
       "google-java-format")
md5sums=('SKIP'
         '820b76e4bd0f582bad2c5902c75a91fd')

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname}"
  mvn install
}

package() {
  mkdir -p "$pkgdir/usr/bin/"
  cp "${srcdir}/google-java-format" "${pkgdir}/usr/bin/"

  mkdir -p "$pkgdir/usr/share/java/"
  cp -r "$srcdir/${pkgname}/" "$pkgdir/usr/share/java/${pkgname%-git}"
  pushd "$pkgdir/usr/share/java/${pkgname%-git}"
  ln -s "$(find ./core/target -name "google-java-format*all-deps.jar")" "google-java-format.jar"
  popd

}

# vim:set ts=2 sw=2 et:
