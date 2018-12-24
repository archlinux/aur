# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_reponame=rpi_ws281x
pkgname=rpi_ws281x-git
_name=${pkgname%-git}
pkgver=182.14aacad
pkgrel=1
arch=('armv6h' 'armv7h' 'aarch64')
pkgdesc='Userspace Raspberry Pi PWM library for WS281X LEDs'
license=('BSD')
depends=()
makedepends=('scons' 'git')
provides=("${_name}")
conflicts=("${_name}")
url="https://github.com/jgarff/${_reponame}"
source=("${_reponame}::git://github.com/jgarff/${_reponame}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_reponame"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_reponame"
  scons
}

package() {
  cd "$srcdir/$_reponame"

  install -Dm0755 "test" "$pkgdir/usr/bin/$_name"
  install -Dm0644 "libws2811.a" "$pkgdir/usr/lib/libws2811.a"
  install -Dm0644 "LICENSE" "$pkgdir/usr/share/licenses/$_name/LICENSE"
  for header_file in *.h; do
    install -Dm0644 "$header_file" "$pkgdir/usr/include/$_name/$header_file"
  done
}
