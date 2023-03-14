# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Doug Newgard <scimmia at archlinux dot info>
# Contributor: jus <jus@bitgrid.net>
# Contributor: jfperini <@jfperini>

pkgname=vocal-git
pkgver=2.4.2.r73.gfeacd31
pkgrel=1
pkgdesc='Powerful, beautiful, and simple podcast client for the modern free desktop'
arch=('x86_64')
url='https://github.com/VocalPodcastProject/vocal'
license=('GPL3')
depends=('clutter-gst' 'granite' 'libadwaita' 'libgee' 'sqlite' 'webkit2gtk-4.1')    # 'libsecret'
makedepends=('git' 'meson' 'vala')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=($pkgname::git+$url.git)
sha256sums=('SKIP')

pkgver() {
  git -C $pkgname describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  meson setup --buildtype=plain --prefix=/usr $pkgname build

  #meson -C build compile
  ninja -C build
}

check() {
  #meson -C build test
  ninja -C build test
}

package() {
  #meson -C build install --destdir="$pkgdir"
  DESTDIR="$pkgdir" ninja -C build install
}
