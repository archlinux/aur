# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Maintainer: Truocolo <truocolo@aol.com>
# Contributor: Sam Whited <sam@samwhited.com>
# Contributor: geno <dev@fireorbit.de>
# Contributor: <luntik2012@gmail.com>
# Contributor: Julian Fairfax <juliannfairfax@protonmail.com> 

_pkg="chatty"
_Pkg="Chatty"
pkgname="purism-${_pkg}"
_pkgver=0.8.0
pkgver="v${_pkgver}"
pkgrel=1
pkgdesc="XMPP and SMS messaging via libpurple and Modemmanager"
url="https://gitlab.gnome.org/World/${_Pkg}"
license=(
  GPL3)
arch=(
  x86_64
  i686
  armv6h
  armv7h
  aarch64
  arm
)
depends=(
  evolution-data-server
  feedbackd
  libhandy
  libolm
  libpurple-carbons
)
optdepends=(
  'libpurple-lurch: XMPP E2E OMEMO encryption'
  'purple-xmpp-http-upload: XMPP HTTP Upload - Filesharing'
)
makedepends=(
  meson
  pkg-config
)
_commit="5e9dacb8080d99b15cc9e97455bf7ab41d42edd3"
source=(
  # "git+${url}.git#commit=${_commit}")
  "${url}/-/archive/${pkgver}/${_Pkg}-${pkgver}.tar.gz")
sha512sums=(
  '4fdba6f4f3787ddae37e52000cd9d882431a333520e8df07bc3f4e6f192894998600f5c6ff6a482eb0d7b4bd9c33cf541240e4aad87fe4dc79c82e3b630c7e48'
)

build() {
  # git \
  #   -C "${_pkg}" \
  #   submodule \
  #     update \
  #       --init
  arch-meson \
    "${_Pkg}-${pkgver}" \
    build
  ninja \
    -C \
      build
}

package() {
  DESTDIR="${pkgdir}" \
    ninja \
      -C build \
        install
}

# vim:set sw=2 sts=-1 et:
