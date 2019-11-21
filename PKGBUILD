# Maintainer: Joost Bremmer <contact@madeofmagicandwires.online>
pkgname=mpv-filenavigator-git
pkgver=r36.199fc33
pkgrel=2
pkgdesc="MPV Plugin to navigate and open your local files in mpv"
arch=('any')
url="https://github.com/jonniek/mpv-filenavigator"
license=('Unlicense')
makedepends=('git')
source=("${pkgname%-git}::git+https://github.com/jonniek/mpv-filenavigator.git")
sha256sums=("SKIP")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

# template start; name=git-pkgver; version=1;
pkgver() {
  cd ${pkgname%-git}
  git describe --long --tags 2>/dev/null | sed 's/[^[:digit:]]*\(.\+\)-\([[:digit:]]\+\)-g\([[:xdigit:]]\{7\}\)/\1.r\2.g\3/;t;q1'
    [ ${PIPESTATUS[0]} -eq 0 ] || \
  # template start; name=git-revcount; version=1;
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  # template end;
}

# vim: filetype=sh
# template end;

package() {
  cd "${pkgname%-git}"
  install -Dvm755 "navigator.lua" "${pkgdir}/usr/lib/mpv/${pkgname%-git}.lua"
}

# vim: set ts=2 sts=2 sw=2 et :
