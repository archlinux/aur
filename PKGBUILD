# Maintainer: Andrew Shark <ashark linuxcomp ru>

pkgname=kde-builder-git
_basename="${pkgname%-git}"
pkgver=r57.c5acc46
pkgrel=1
pkgdesc="A script to build KDE software"
url="https://invent.kde.org/ashark/kde-builder"
arch=("any")
license=("GPL")
depends=("python-promise" "python-yaml" "python-setproctitle" "python-overrides")
optdepends=(
  "python-pytest: testing support"
  "python-type-enforced: for developers"  # Currently not in AUR
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
  ln -sfv "/usr/share/${_basename}/${_basename}-launch" "${pkgdir}/usr/bin/${_basename}-launch"
}
