# Maintainer: sfs <sfslinux.gmail.com>

pkgname=sensindicator-git
pkgver=0.1.0.r.g
pkgrel=1
pkgdesc='Small GTK3 tray sensor monitor with SNI support'
arch=('x86_64')
url='https://local/sensindicator'
license=('GPL-3.0-or-later')
depends=('gtk3' 'lm_sensors')
makedepends=('meson' 'ninja' 'vala' 'pkgconf' 'git')
source=('git+https://github.com/sfs-pra/sensindicator.git')
sha256sums=(SKIP)

pkgver() {
  printf "%s.r%s.g%s" "0.1.0" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/sensindicator"
  meson setup build-pkg --prefix=/usr --buildtype=release --wrap-mode=nodownload
  meson compile -C build-pkg
}

package() {
  cd "$srcdir/sensindicator"
  DESTDIR="$pkgdir" meson install -C build-pkg

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
