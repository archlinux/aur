# Maintainer: Yaohan Chen <yaohan.chen@gmail.com>

_appname='syder-arcade'
pkgname="${_appname}-hib"
pkgdesc="A free scrolling multi directional shoot 'em up"
pkgver=1396896809
license='custom: Commercial'
pkgrel=2
url='http://www.studioevil.com/games/syder-arcade'
arch=('i686' 'x86_64')
_desktopfile="${_appname}.desktop"
source=("hib://SyderArcade_Linux_${pkgver}.zip"
        "$_desktopfile")
md5sums=('c665a69be0d8be8eb99f240d38d2e07a'
         'f9be4058d493813f225e65878711f3c8')
depends=('libglapi')

package() {
  _installdir="opt/$_appname"
  install -d "$pkgdir/$_installdir"

  cd "$srcdir/Linux"

  declare -A _arch=(['i686']='x86' ['x86_64']='x86_64')
  declare -A _wrongarch=(['i686']='x86_64' ['x86_64']='x86')

  _sourceappname='SyderArcade_Humble'
  _exec="$_installdir/$_appname"
  install -Dm755 "${_sourceappname}.${_arch[$CARCH]}" "$pkgdir/$_exec"
  _bindir="$pkgdir/usr/bin"
  install -d "$_bindir"
  ln -s "/$_exec" "$_bindir/$_appname"

  _sourcedatadir="${_sourceappname}_Data"
  install -Dm644 "$_sourcedatadir/Resources/UnityPlayer.png" \
                 "$pkgdir/usr/share/icons/${_appname}.png"

  install -Dm644 "$srcdir/$_desktopfile" "$pkgdir/usr/share/applications/$_desktopfile"

  rm -r "$_sourcedatadir/"{Mono,Plugins}"/${_wrongarch[$CARCH]}"
  mv "$_sourcedatadir" "$pkgdir/$_installdir/${_appname}_Data"
}
