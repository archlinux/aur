# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='headset-charge-indicator-qt'
pkgname="${_pkgname}-git"
pkgver=0.r88.5fb2faa
pkgrel=1
pkgdesc='Qt6-based system tray application to display battery charge of wireless headsets with enhanced KDE Plasma integration'
arch=('any')
url='https://github.com/jpsutton/headset-charge-indicator-qt'
license=('BSD')
depends=('headsetcontrol' 'python' 'pyside6')
optdepends=('kstatusnotifieritem: Enhanced KDE Plasma integration with rich tooltips and native notifications')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  # Try to get version from tags first, fall back to commit count if no tags exist
  if git describe --long --tags >/dev/null 2>&1; then
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    # No tags found, use commit count and hash
    printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

package() {
  cd "${_pkgname}"
  install -Dvm755 "${_pkgname}.py" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dvm644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
