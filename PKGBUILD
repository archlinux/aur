# Maintainer: Torben <git@letorbi.com>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=processing-examples
pkgver=4.4.5
_build=1305
pkgrel=1
arch=('any')
pkgdesc="Examples for Processing"
url='https://www.processing.org/'
license=(GPL LGPL)
makedepends=(gradle)
source=("https://github.com/processing/processing4/archive/processing-$_build-$pkgver.tar.gz")
sha256sums=('90442160640ee3a8434e23373d0bde3431aa5d78d4387adddb0e635eeddf1af1')

prepare() {
  # Symbolic link for not having to repeat the revision number
  ln -sf "processing4-processing-$_build-$pkgver" "$pkgname"

  # Pass version number to build process
  echo "version=$pkgver" > "$pkgname/gradle.properties"
}

build() {
  cd "$pkgname"

  # Build the examples
  JAVA_HOME="/usr/lib/jvm/java-17-openjdk" gradle includeProcessingExamples includeProcessingWebsiteExamples
}

package() {
  install -d "$pkgdir/usr/share/processing/lib/app/resources/modes/java/"
  cp -r "$pkgname/app/build/resources-bundled/common/modes/java/examples" "$pkgdir/usr/share/processing/lib/app/resources/modes/java/"
}
