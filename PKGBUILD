# Maintainer: Your Name <youremail@domain.com>

pkgname=hackgregator-git
_pkgname=hackgregator
pkgver=0.3.0.r9.g2c3ce65
pkgrel=1
pkgdesc="This application is a comfortable reader application for news.ycombinator.com"
arch=('any')
url="https://gitlab.com/gunibert/hackgregator"
license=('GPL3')
depends=('glib2' 'gtk3' 'libhandy' 'libsoup' 'json-glib' 'webkit2gtk')
makedepends=('git' 'gobject-introspection' 'meson' 'ninja')
provides=()
conflicts=()
replaces=()
source=(git+$url.git)
noextract=()
md5sums=(SKIP) #autofill using updpkgsums

pkgver() {
  cd "$_pkgname"
  #printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"  
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson $_pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}
