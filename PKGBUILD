# Maintainer: Sabart Otto - Seberm <seberm[at]gmail[dot].com

pkgname=titulky_com_downloader
pkgver=20130119
pkgrel=1
pkgdesc="Downloads subtitles from titulky.com"
url="https://gitorious.org/titulky_com_downloader"
arch=('i686' 'x86_64')
license=('GPLv3')
install=
source=()
depends=('python')
provides=''
makedepends=('git')

_gitname="$pkgname"
_gitroot="git://gitorious.org/${_gitname}/${_gitname}.git"


build() {
  cd $srcdir
  msg "Connecting to GIT (${_gitroot}) ..."

  if [ -d "$_gitname" ]; then
    cd "$_gitname" && git pull origin
    msg "The local files of ${_gitname} were updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi
  
  msg "GIT checkout done or server timeout"

  mkdir -p "$pkgdir/usr/share/${pkgname}/"
  mkdir -p "$pkgdir/usr/bin/"
  cp -R "${srcdir}/${_gitname}/src" "$pkgdir/usr/share/${pkgname}/"
  chmod +x "$pkgdir/usr/share/${pkgname}/src/TitulkyDownloader.py"
  ln -s "/usr/share/${pkgname}/src/TitulkyDownloader.py" "$pkgdir/usr/bin/${pkgname}"
}
