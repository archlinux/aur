# Maintainer: Andrew Shark <ashark linuxcomp ru>

pkgname=kde-builder-git
_basename="${pkgname%-git}"
pkgver=r61.80c3c95
pkgrel=1
pkgdesc="A tool to build KDE software"
url="https://invent.kde.org/sdk/kde-builder"
arch=("any")
license=("GPL")
depends=("dbus-python" "python-overrides" "python-promise" "python-yaml" "python-setproctitle")

optdepends=(
  "python-pytest: testing support"
  "python-type-enforced: ensure annotated types correspond the real types - for developers"
)

source=("git+https://invent.kde.org/ashark/kde-builder.git")
sha256sums=("SKIP")

pkgver() {
  cd "${_basename}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  mkdir -p "${pkgdir}/usr/share"
  cp -r "${srcdir}/${_basename}" "${pkgdir}/usr/share/${_basename}"
  mkdir -p "${pkgdir}/usr/bin"
  ln -sfv "/usr/share/${_basename}/${_basename}" "${pkgdir}/usr/bin/${_basename}"
}
