## Maintainer: pyamsoft <pyam.soft@gmail.com>

pkgname=steam-wrapper-git
_gitname=steam-wrapper
pkgdesc="Steam wrapper for common operations (git version)"
pkgver=0.2.3.r100.9663bba
pkgrel=1
arch=('i686' 'x86_64')
optdepends=('steam-native: Native runtime library support' \
        'steam-libs: Native steam libraries support')
depends=('steam' 'bash' 'coreutils' 'findutils')
makedepends=('git')
provides=('steam-wrapper')
conflicts=('steam-wrapper')
license=('GPLv2')
url="https://github.com/pyamsoft/steam-wrapper.git"
source=("${_gitname}::git+${url}#branch=dev")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "%s.r%s.%s" "$(awk -F '=' \
    '{if (/^wrapper_version=/) {print $2}}' \
    'steam-wrapper')" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_gitname"

  # Install the script
  install -Dm 755 "${_gitname}" "${pkgdir}/usr/bin/${_gitname}"
    # Install the desktop file
  install -Dm644 "${_gitname}.desktop" \
          "${pkgdir}/usr/share/applications/${_gitname}.desktop"

    # Install the default configuration
  install -Dm 644 "${_gitname}.conf" \
          "${pkgdir}/etc/${_gitname}/${_gitname}.conf"
}

