# Maintainer: maz-1 <ohmygod19993 at gmail dot com>
pkgname=rpg2003-rtp
pkgver=100
pkgrel=1
pkgdesc="RPGMaker 2003 Runtime Package"
url='http://www.rpgmakerweb.com/download/additional/run-time-packages'
arch=('any')
license=('custom: commercial')
makedepends=('p7zip')

prepare() {
  cd "$srcdir/.."
  file_name=2003rtp.7z
  [ -f "$file_name" ] && checksum=`md5sum "$file_name" | grep -oP '[0-9a-z]+' | head -n 1` || true
  [ "z""$checksum" = "z""20fb5164724c2fe6c44a79df3cc94e22" ] || \
    ( rm -f "$file_name" ; \
    wget --no-check-certificate "http://pan.plyz.net/d.asp?u=118488466&p=$file_name" -O "$file_name" )
  [ -f "$srcdir/$file_name" ] || ln -s "../$file_name" "$srcdir/$file_name"
  cd "${srcdir}"
  7z x $file_name
}

package() {
  mkdir -p "$pkgdir/opt/"
  cp -r "$srcdir/RTP" "$pkgdir/opt/$pkgname"
}
