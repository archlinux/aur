# Maintainer: Chiku < chirantan dot mitra at gmail dot com >

pkgname=zukitwo-themes-git
pkgver=v4.0.r2.g38920a8
pkgrel=1
pkgdesc='A theme for GTK3, GTK2, Metacity, xfwm4, Gnome Shell and Unity - git version'
arch=('any')
url='https://github.com/lassekongo83/zuki-themes'
license=('GPL3')
depends=('gtk-engines' 'gtk-engine-murrine')
optdepends=('gnome-themes-standard: Required for the GTK3 theme'
            'ttf-roboto: Font family for the Gnome Shell theme')
makedepends=('git' 'ninja' 'meson' 'sassc')
provides=('zukitwo-themes')
conflicts=('zukitwo-themes')
source=("${pkgname}::git+${url}")
sha512sums=('SKIP')
install=zukitwo-themes-git.install

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^foo-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  rm -rf build
  arch-meson "$pkgname" build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
