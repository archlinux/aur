# Maintainer: arichiardi <a.richiardi.work@gmail.com>
pkgname=input-leap-bin
pkgver=3.0.3
pkgrel=1
pkgdesc="Open-source KVM software"
arch=('x86_64')
url='https://github.com/input-leap/input-leap'
license=(LicenseRef-GPL-2.0-only-WITH-OpenSSL-Exception)
depends=(
  avahi
  gcc-libs
  glib2
  glibc
  hicolor-icon-theme
  libei
  libportal
  libx11
  libxext
  libxi
  libxinerama
  libxkbcommon
  libxkbcommon-x11
  libxrandr
  libxtst
  openssl
  qt6-base
  xdg-desktop-portal
)
makedepends=(
  tar
)
options=('!strip' '!emptydirs' '!debug')
install=${pkgname}.install
provides=('input-leap')
conflicts=(
  input-leap
  input-leap-git
  input-leap-headless
  input-leap-headless-git
)


_debname=input-leap-debian-12-latest-libei
_debtar="${_debname}-v${pkgver}.tar.gz"

source=(
  "${url}/releases/download/v${pkgver}/${_debtar}"
  "${url}/archive/refs/tags/v${pkgver}.tar.gz"
)

package() {
  local realpkgname=input-leap
  local srcpkgdir=${realpkgname}-${pkgver}
  local pkgusrdir="${pkgdir}/usr"

  mkdir -p "${pkgusrdir}"

  tar -xvf "${srcdir}/${_debname}/${_debname}.tar.gz" --strip-components=1 -C "${pkgusrdir}"

  # Set permissions for files in the /usr/bin
  find "${pkgusrdir}/bin" -type f -exec chmod 755 {} \;

  mkdir -p "${pkgusrdir}/share/doc/${realpkgname}"
  mkdir -p "${pkgusrdir}/share/licenses/${realpkgname}"

  # Install ancillary files
  install -Dm 644 ${srcpkgdir}/README.md -t "${pkgdir}/usr/share/doc/${realpkgname}"
  install -Dm 644 ${srcpkgdir}/doc/input-leap.conf* -t "${pkgdir}/usr/share/doc/${realpkgname}"
  install -Dm 644 ${srcpkgdir}/LICENSE -t "${pkgdir}/usr/share/licenses/${realpkgname}"
}

sha256sums=('b08dd7575c57174030af5ce1eed2788e16f0543f938cfac390e46cfbb18ff53a'
            'fbbf6e3f99abccfc3592939a039daf13f0e003dd33764c7c591d354b1a6c07eb')
