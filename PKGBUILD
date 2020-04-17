# Maintainer: Ward Segers <w@rdsegers.be>

pkgname=otf-inter
_pkgname=Inter
pkgver=3.13
pkgrel=1
pkgdesc="Typeface carefully crafted & designed for computer screens."
arch=('any')
conflicts=('inter-font')
url="https://github.com/rsms/inter"
license=('custom:OFL')
depends=(fontconfig xorg-font-utils)
source=("https://github.com/rsms/inter/releases/download/v$pkgver/$_pkgname-$pkgver.zip")
sha512sums=("dd9249833383373b2f45a0c7b47a3d0f71234b685475962c8299fa02ec1271602ce33ff43c9ce20019eef069b771d5c62a3f28fddc654bc451dc363c65361dda")


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

