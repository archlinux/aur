# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Contributor: Rasmus Steinke <rasi at xssn dot at>
pkgname=spop-git
_pkgname=spop
pkgver=r328.1a26dec
pkgrel=1
pkgdesc="A Spotify client running as a daemon, similar to mpd."
arch=('i686' 'x86_64')
url='https://github.com/Schnouki/spop'
license=('GPL')
depends=('libspotify' 'json-glib')
makedepends=('git' 'cmake')
optdepends=(
  'libao: libao audio output'
  'sox: libsox audio output'
  'dbus-glib: awesome integration'
  'libnotify: desktop notifications support'
  'libsoup: last.fm scrobble support'
  'python: dspop GUI'
  'dmenu: dspop GUI (or rofi)'
  'rofi: dspop GUI (or dmenu)'
)
source=('git+https://github.com/Schnouki/spop.git')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
    cd "${srcdir}/${_pkgname}"
    cmake -DCMAKE_INSTALL_PREFIX:PATH="${pkgdir}/usr" .
    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    make DEST="${pkgdir}" install
    install -D -m 644 "${srcdir}/${_pkgname-build}"/spopd.conf.sample "${pkgdir}"/usr/share/doc/spop/spopd.conf.sample
}
