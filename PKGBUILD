# Based on quakespasm PKGBUILD

_pkgname=quakespasm
pkgname=${_pkgname}-spiked-git
pkgver=0.92.1.r543.gf1cc25c0
pkgrel=1
pkgdesc="A modern Quake 1 engine. Forked from Quakespasm. AKA QSS. Git version with optional Mission pack desktop files."
arch=('i686' 'x86_64')
url="http://triptohell.info/moodles/qss/"
license=('GPL2')
depends=('libvorbis' 'libmad' 'sdl2' 'opus' 'opusfile')
install=${_pkgname}-spiked.install
source=("${_pkgname}::git+https://github.com/Shpoike/Quakespasm"
        ${_pkgname}-spiked.desktop
        ${_pkgname}-spiked-mp1.desktop
        ${_pkgname}-spiked-mp2.desktop
        ${_pkgname}-spiked-impel.desktop)
sha1sums=('SKIP'
          'd0daa1b98b041664dd8bf30716da7e49ac6606a2'
          '1caecf511611364303a612c06ec9b15f29036e46'
          '4006dba3fa8ce322af72b7b4fbb1fc1d1bb07faf'
          '336a87e11c1a234adcadfea2d807d26d75bbbca9')

# Using the most recent un-annotated tag reachable from the last commit:
pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${_pkgname}/${_pkgname}/Quake/"
  msg "Starting make..."
  make DO_USERDIRS=1 USE_SDL2=1
}

package() {
  cd "$srcdir/${_pkgname}/${_pkgname}/Quake/"
  install -Dm755 quakespasm "$pkgdir"/usr/bin/${_pkgname}-spiked
  
  for i in 16 24 32 48 64 72; do
    install -Dm644 $srcdir/${_pkgname}/${_pkgname}/Misc/QuakeSpasm_512.png $pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/quakespasm-spiked.png
  done

  install -Dm644 $srcdir/${_pkgname}-spiked.desktop $pkgdir/usr/share/applications/${_pkgname}-spiked.desktop
#
# Uncomment lines depending on the mission pack(s)
# or extension you have.
#
# install -Dm644 $srcdir/${_pkgname}-spiked-mp1.desktop $pkgdir/usr/share/applications/${_pkgname}-spiked-mp1.desktop
# install -Dm644 $srcdir/${_pkgname}-spiked-mp2.desktop $pkgdir/usr/share/applications/${_pkgname}-spiked-mp2.desktop
# install -Dm644 $srcdir/${_pkgname}-spiked-impel.desktop $pkgdir/usr/share/applications/${_pkgname}-spiked-impel.desktop

}


