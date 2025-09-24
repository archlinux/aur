# Maintainer: Torben <git@letorbi.com>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=processing-examples
pkgver=4.4.7
_build=1307
pkgrel=1
arch=('any')
pkgdesc="Examples for Processing"
url='https://www.processing.org/'
license=(GPL LGPL)
makedepends=(gradle8)
source=("https://github.com/processing/processing4/archive/processing-$_build-$pkgver.tar.gz")
sha256sums=('b0f908ffd219ef35394f7df72a8df00ca78aa89946d387bf0a4b2997852689d8')

prepare() {
  # Symbolic link for not having to repeat the revision number
  ln -sf "processing4-processing-$_build-$pkgver" "$pkgname"

  # Pass version number to build process
  echo "version=$pkgver" > "$pkgname/gradle.properties"
}

build() {
  cd "$pkgname"

  # Build the examples
  JAVA_HOME="/usr/lib/jvm/java-17-openjdk" gradle8 includeProcessingExamples includeProcessingWebsiteExamples
}

package() {
  install -d "$pkgdir/usr/share/processing/lib/app/resources/modes/java/"
  cp -r "$pkgname/app/build/resources-bundled/common/modes/java/examples" "$pkgdir/usr/share/processing/lib/app/resources/modes/java/"
}
