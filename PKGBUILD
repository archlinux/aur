# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="ntopng-data"
# to update visit https://packages.ntop.org/apt/trixie/all/ and keep track of the latest pkgver, date and build
_pkgmeta=("$(
  curl -s https://packages.ntop.org/apt/trixie/all/Packages |\
  pcregrep -Mo 'Package: ntopng-data(.+|(\n.)+)+\n\n'
)")
_pkgverAmd=6.7
_dateAmd=260121
# updated automatically
pkgver="$(echo $_pkgmeta | grep -Po '(?<= )[0-9]+\.[0-9]+\.[0-9]{6}')"
pkgrel=1
pkgdesc="Web-based traffic monitoring"
url="Geolocation databases for ntopng and other ntop software packaged from https://db-ip.com"
license=("GPL3")
arch=("any")
depends=("ntopng")
source=("https://packages.ntop.org/apt/trixie/all/ntopng-data_${pkgver}_all.deb")
# the sha512 sums are present in https://packages.ntop.org/apt/trixie/all/Packages
sha512sums=("$(echo $_pkgmeta | grep -Po '[0-9a-f]{128}')")
options=("!strip")

pkgver(){
  echo $_pkgmeta | grep -Po '(?<= )[0-9]+\.[0-9]+\.[0-9]{6}'
}

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 # program files
 cp -r "usr" "$pkgdir"
}
