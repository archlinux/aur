# Maintainer: fossdd <fossdd@pwned.life>
pkgname=hiprompt-gtk-git
_pkgname=${pkgname%-git}
pkgver=r2.705ec83
pkgrel=1
pkgdesc='Legacy GTK3 prompter for Himitsu, do not use'
url='https://sr.ht/~sircmpwn/himitsu'
license=(GPL-3.0)
arch=(x86_64)
depends=()
makedepends=(meson make clang gtk-layer-shell gtk3)
conflicts=(hiprompt-gtk-py-git)
provides=(hiprompt-gtk)
source=("git+https://git.sr.ht/~sircmpwn/hiprompt-gtk")
sha256sums=('SKIP')

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
  cd "$_pkgname/build"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  #meson install -C build --destdir "$pkgdir"
}
