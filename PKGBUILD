# Maintainer: Matthias Mailänder <matthias@mailaender.name>
pkgname=mzmine3
pkgdesc='mass-spectrometry data processing'
pkgver=4.0.3
pkgrel=2
arch=('any')
url="https://www.mzmine.org"
license=('GPL3')
depends=("java-runtime>=21" "hicolor-icon-theme")
makedepends=("java-environment>=21" "archlinux-java-run")
source=("git+https://github.com/mzmine/mzmine3.git#tag=v${pkgver}"
        "mzmine.desktop")
sha256sums=('SKIP'
            'SKIP')

build() {
  cd "${pkgname}"

  JAVA_HOME=$(archlinux-java-run --min 21 --feature jdk --java-home) \
    ./gradlew
}

package() {
  cd "${pkgname}"
  mkdir -p "${pkgdir}/opt/mzmine3"
  cp -r mzmine-community/build/jpackage/mzmine/ "${pkgdir}/opt/mzmine3"
  mkdir -p "${pkgdir}/usr/bin"
  ln -sf "${pkgdir}/opt/mzmine3/mzmine/bin/mzmine" "${pkgdir}/usr/bin/mzmine"

  install -Dm0644 mzmine-community/build/resources/main/mzmineIcon.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/mzmine.png"
  install -Dm0644 ../mzmine.desktop "${pkgdir}/usr/share/applications/mzmine.desktop"
}
