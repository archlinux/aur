## Maintainer: pyamsoft <pyam.soft@gmail.com>

_gitname=steam-wrapper
# shellcheck disable=SC2034
pkgname=steam-wrapper-git
# shellcheck disable=SC2034
pkgdesc="Steam wrapper for common operations (git version)"
# shellcheck disable=SC2034
pkgver=0.7.0.r159.3da61f7
# shellcheck disable=SC2034
pkgrel=1
# shellcheck disable=SC2034
arch=('i686' 'x86_64')
# shellcheck disable=SC2034
optdepends=('steam-native-runtime: Native runtime library support')
# shellcheck disable=SC2034
depends=('steam')
# shellcheck disable=SC2034
makedepends=('git')
# shellcheck disable=SC2034
provides=('steam-wrapper')
# shellcheck disable=SC2034
conflicts=('steam-wrapper')
# shellcheck disable=SC2034
license=('GPLv2')
# shellcheck disable=SC2034
sha256sums=('SKIP')
url="https://github.com/pyamsoft/steam-wrapper.git"
# shellcheck disable=SC2034
source=("${_gitname}::git+${url}")

pkgver() {
  # shellcheck disable=SC2154
  cd "$srcdir/$_gitname" || {
    msg "Could not cd into ${srcdir}/$_gitname"
    return 1
  }

  printf "%s.r%s.%s" "$(awk -F '=' \
    '{if (/^WRAPPER_VERSION=/) {print $2}}' \
    'steam-wrapper')" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

package() {
  # shellcheck disable=SC2154
  cd "$srcdir/$_gitname" || {
    msg "Could not cd into ${srcdir}/$_gitname"
    return 1
  }

  # Install the script
  # shellcheck disable=SC2154
  install -Dm 755 "${_gitname}" "${pkgdir}/usr/bin/${_gitname}"
    # Install the desktop file
  install -Dm644 "${_gitname}.desktop" \
          "${pkgdir}/usr/share/applications/${_gitname}.desktop"

    # Install the default configuration
  install -Dm 644 "${_gitname}.conf" \
          "${pkgdir}/etc/${_gitname}/${_gitname}.conf"
}

