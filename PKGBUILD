# Maintainer: izzqz <v@izzqz.me>
# Contributor: Eric Engestrom <aur@engestrom.ch>
# Contributor: Chad "crossroads1112" Sharp <crossroads1112@riseup.net>

pkgname=open-dyslexic-fonts-git
pkgver=0.91.12+109.g77bda89f3f
pkgrel=1
pkgdesc="Typeface that uses typeface shapes & features to help offset some visual symptoms of Dyslexia"
arch=(any)
url="https://forge.hackers.town/antijingoist/opendyslexic"
license=('OFL-1.1-RFN')
replaces=('ttf-opendyslexic' 'otf-opendyslexic-git')
makedepends=(git)
source=(git+https://forge.hackers.town/antijingoist/opendyslexic.git)
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
