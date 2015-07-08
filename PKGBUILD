# Maintainer: M0Rf30

pkgname=flixtor
pkgver=2.2.5
pkgrel=2
if [[ "$CARCH" == 'x86_64' ]] ; then
   _platform="linux64"
else
   _platform="linux32"
fi
pkgdesc="Flixtor streams movies, series, videos and animes from Torrents."
arch=('x86_64' 'i686')
url="http://www.flixtor.me/"
license=('GPL3')
options=('!strip')
install="flixtor.install"
_gitname="Flixtor"
source=("https://dl.dropboxusercontent.com/u/7226803/${_gitname}_${_platform}.tar.gz"
	"flixtor.png"
        "flixtor.install"
        "flixtor.desktop")
_DEST="/usr/share/flixtor"
provides=("flixtor")

build() {
  # Thanks to Revelation60 for pointing it out
  # https://github.com/rogerwang/node-webkit/wiki/The-solution-of-lacking-libudev.so.0
  msg2 "Patching program to fix libudev.so.0 problem"
  cd "${srcdir}/${_gitname}"
  sed -i 's/\x75\x64\x65\x76\x2E\x73\x6F\x2E\x30/\x75\x64\x65\x76\x2E\x73\x6F\x2E\x31/g' ${_gitname}
}

package() {

  # Program
  mkdir -p "${pkgdir}/usr/share/data"
  cp -r "${srcdir}/${_gitname}" "${pkgdir}${_DEST}"


  # Link to program
  msg2 "Symlink /usr/bin/${provides[0]} -> ${_DEST}/"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "${_DEST}/${_gitname}" "${pkgdir}/usr/bin/${provides[0]}"
  

  # Desktop file
  install -Dm644 "${srcdir}/flixtor.desktop" "${pkgdir}/usr/share/applications/flixtor.desktop"

  # Icon
  install -Dm644 "${srcdir}/flixtor.png" "${pkgdir}/usr/share/pixmaps/flixtor.png"
}

if [[ "$CARCH" == 'i686' ]] ; then
md5sums=('d7aeddc4a013122b2559fbd599cc62de'
	 '3b2c42be51b39aff65dc2c67bb94dc27'
         '4aaa38bac8fbe04fe517a1cf93ca3da4'
         '2716817a9ce83bb89c75aa82d7f4dcf8')
elif [[ "$CARCH" == 'x86_64' ]] ; then
md5sums=('6031f8d62c6c384380b9b47191af764a'
	 '3b2c42be51b39aff65dc2c67bb94dc27'
         '4aaa38bac8fbe04fe517a1cf93ca3da4'
         '2716817a9ce83bb89c75aa82d7f4dcf8')
fi

