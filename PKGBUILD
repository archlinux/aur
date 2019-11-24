# Maintainer: Ward Segers <w@rdsegers.be>

pkgname=otf-inter
_pkgname=Inter
pkgver=3.11
pkgrel=1
pkgdesc="Inter is a typeface carefully crafted & designed for computer screens."
arch=('any')
url="https://github.com/rsms/inter"
license=('custom:OFL')
depends=(fontconfig xorg-font-utils)
source=("https://github.com/rsms/inter/releases/download/v$pkgver/$_pkgname-$pkgver.zip")
sha512sums=("577788f094fac90e45fcc1fe25f73b78f48a426d6506a254b441e575df688a5622a19301610709de055cd276464af227ac4502c74dfe1a20685389486e24a135")

package() {
  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cd "$_pkgname"
  install -d "${pkgdir}/usr/share/fonts/OTF"
  install -m644 *.otf "${pkgdir}/usr/share/fonts/OTF/"
}

post_install() {
  echo -n "Updating font cache... "
  fc-cache -s
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
