# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="ntopng-data"
# to update visit https://packages.ntop.org/apt/trixie/all/ and keep track of the latest pkgver, date and build
_pkgverAmd=6.7
_dateAmd=260120
# updated automatically
pkgver="$_pkgverAmd.$_dateAmd"
pkgrel=1
pkgdesc="Web-based traffic monitoring"
url="Geolocation databases for ntopng and other ntop software packaged from https://db-ip.com"
license=("GPL3")
arch=("any")
depends=("ntopng")
source=("https://packages.ntop.org/apt/trixie/all/ntopng-data_${_pkgverAmd}.${_dateAmd}_all.deb")
# the sha512 sums are present in https://packages.ntop.org/apt/trixie/all/Packages
# skipping for now; requires maintainer to download and hash the .deb
# -or- grepping https://packages.ntop.org/apt/trixie/all/Packages
_Packages=(curl -s https://packages.ntop.org/apt/trixie/all/Packages )
_PackageMatch=(pcregrep -M '^SHA512: [0-9a-f]{128}\nDescription: Geolocation databases for ntopng' "${_Package}" )
#sha512sums=( grep -Eo '[0-9a-f]{128}' "${_PackageMatch}" )
#sha512sums=('016a3ebf2cfebab53ee60559bd8fef40f52a1b54bd387fc85f487e7c9a700188c68f444234c313d0923c12a260c43a02ba9579f606f70e73290308c21cb74b17')
sha512sums=("SKIP")
options=("!strip")

pkgver(){
  _pkgver="$(
    curl -s https://packages.ntop.org/apt/trixie/all/ |\
    grep -Eo '>ntopng-data_([0-9.]+)_all.deb' |\
    grep -Eo '[0-9]+\.[0-9]+\.[0-9]+')"
  _dateAmd="$(echo $_pkgver | grep -Eo '\.[0-9]{6}$' | grep -Eo '[0-9]{6}')"
  echo $_pkgver;
}

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 # program files
 cp -r "usr" "$pkgdir"
}
