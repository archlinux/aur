# Maintainer: Ward Segers <w@rdsegers.be>

pkgname=otf-inter
_pkgname=Inter
pkgver=3.12
pkgrel=1
pkgdesc="Inter is a typeface carefully crafted & designed for computer screens."
arch=('any')
url="https://github.com/rsms/inter"
license=('custom:OFL')
depends=(fontconfig xorg-font-utils)
source=("https://github.com/rsms/inter/releases/download/v$pkgver/$_pkgname-$pkgver.zip")
sha512sums=("56ec55f3f83b5881c67d72e9d8e82a14f2c27f638613356946f6e329ca24d5d1b07d7835a17850b5a5cb24acbc40f89b60311dbac5478ca924a6fb8f7020cfef")

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
