# Maintainer: "UnCO" Lin <trash__box <_at_> 163.com>

pkgname=ffmpeg-static-bin-nightly
pkgver=20150129.ga21acd5
pkgrel=1
pkgdesc="Universal multimedia toolkit nightly static build (binary)"
#epoch=0
arch=('i686' 'x86_64')
license=('GPL')
url="http://johnvansickle.com/ffmpeg/"

_arch='32bit'
[ "$CARCH" = 'x86_64' ] && _arch='64bit'

_pkgver=$(curl $url | sed -n 's/\s*git: \([0-9a-z]\+\) built on \([0-9]\+\)/\2.\1/p')
_pkgname=ffmpeg-git-${_pkgver//\.*}-${CARCH}-static
_filename=${_pkgname}.tar.xz
source=("${_filename}::http://johnvansickle.com/ffmpeg/builds/ffmpeg-git-${_arch}-static.tar.xz")
makedepends=('curl')
# XXX extracted path's date dismatch the date on his homepage.
noextract=("${_filename}")
md5sums=('SKIP')

pkgver() {
  echo $_pkgver
}

prepare() {
  tar --one-top-level="$_pkgname" --strip-components=1 -xf "$_filename"
}

package() {
  cd "$srcdir/$_pkgname"
  mkdir -p "$pkgdir"/usr/bin/
  mkdir -p "$pkgdir"/usr/share/${pkgname}/doc
  find . -executable -type f -exec install -m755 {} "$pkgdir"/usr/bin/{}-nightly \;
  cp -a manpages readme.txt "$pkgdir"/usr/share/${pkgname}/doc/
  cp -a presets "$pkgdir"/usr/share/${pkgname}/
}

# vim:set ts=2 sw=2 et:

