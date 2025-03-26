# Maintainer: Andrew Shark <ashark linuxcomp ru>

pkgname=kde-builder-git
_basename="${pkgname%-git}"
pkgver=r467.0fbeb97
pkgrel=1
pkgdesc="A tool to build KDE software"
url="https://invent.kde.org/sdk/kde-builder"
arch=("any")
license=("GPL")
depends=("git" "dbus-python" "python-yaml" "python-setproctitle")

optdepends=(
  "python-pytest: testing support"
)

source=("git+https://invent.kde.org/sdk/kde-builder.git")
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
  mkdir -p "${pkgdir}/usr/share/zsh/site-functions"
  ln -sfv "/usr/share/${_basename}/data/completions/zsh/_kde-builder" "${pkgdir}/usr/share/zsh/site-functions/_kde-builder"
  ln -sfv "/usr/share/${_basename}/data/completions/zsh/_kde-builder_projects_and_groups" "${pkgdir}/usr/share/zsh/site-functions/_kde-builder_projects_and_groups"
}
