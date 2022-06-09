# Maintainer: fossdd <fossdd@pwned.life>
pkgname=hiprompt-gtk-py-git
_pkgname=${pkgname%-git}
pkgver=r12.9c457a9
pkgrel=1
pkgdesc='A GTK+ Himitsu prompter for Wayland'
url='https://sr.ht/~sircmpwn/himitsu'
license=(GPL-3.0)
arch=(x86_64)
depends=()
makedepends=(meson python gtk-layer-shell gtk3)
conflicts=(hiprompt-gtk-git)
provides=(hiprompt-gtk)
source=("git+https://git.sr.ht/~sircmpwn/hiprompt-gtk-py")
sha256sums=('SKIP')
install="hiprompt-gtk-py-git.install"

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  meson --prefix=/usr --buildtype=plain . build
  meson compile -C build
}

check() {
  cd "$_pkgname"
  meson test -C build
}

package() {
  cd "$_pkgname/build/hiprompt_gtk"
  install -Dm755 "hiprompt-gtk" "$pkgdir/usr/bin/hiprompt-gtk"
  install -Dm755 "hiprompt.gresource" "$pkgdir/usr/share/hiprompt-gtk/hiprompt.gresource"
}
