# Maintainer: Eric Engestrom <aur@engestrom.ch>
# Contributor: Chad "crossroads1112" Sharp <crossroads1112@riseup.net>

pkgname=open-dyslexic-fonts-git
pkgver=0.91.12+30.ge7ac50af1a
pkgrel=1
pkgdesc="Typeface that uses typeface shapes & features to help offset some visual symptoms of Dyslexia"
arch=(any)
url="https://opendyslexic.org"
license=(SIL-OFL)
makedepends=(git)
source=(git+https://github.com/antijingoist/opendyslexic.git)
sha256sums=(SKIP)
provides=(open-dyslexic-fonts)
conflicts=(open-dyslexic-fonts)

pkgver() {
  cd opendyslexic
  git describe --tags --abbrev=10 | sed 's/^v//; s/-/+/; s/-/./'
}

package() {
  cd opendyslexic
  for otf in compiled/OpenDyslexic-*.otf; do
    install -Dm644 $otf "$pkgdir"/usr/share/fonts/OTF/${otf##*/}
  done
  install -Dm644 OFL.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
