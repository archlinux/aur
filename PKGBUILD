# Maintainer:  Caleb Maclennan <caleb@alerque.com>

pkgname=otf-bravura
pkgver=1.204
pkgrel=1
pkgdesc="an SMuFL compliant music font designed by Daniel Spreadbury at Steinberg"
arch=('any')
url="http://www.smufl.org/fonts/"
license=('OFL')
depends=('fontconfig' 'xorg-font-utils')
source=("http://www.smufl.org/files/bravura-${pkgver}.zip")
sha256sums=('d9e13fa8be3185169ae761eee684ed3d1a6f2f32b7b861186da3610e462f0ee7')

post_install() {
  echo -n "Updating font cache... "
  fc-cache -s >/dev/null
  mkfontscale /usr/share/fonts/OTF
  mkfontdir /usr/share/fonts/OTF
  echo "done."
}

post_upgrade() {
  post_install $1
}

post_remove() {
  post_install $1
}

package() {
    cd "${srcdir}"
    find . -name '*.otf' -execdir install -Dm644 {} $pkgdir/usr/share/fonts/OTF/{} \;
    install -Dm644 "OFL.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
