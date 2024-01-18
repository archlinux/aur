# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer:  Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>
# Maintainer:  Truocolo <truocolo@aol.com>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>

# toolchain build order: 
#   linux-api-headers -> 
#     glibc -> 
#       binutils ->
#         gcc->
#           glibc->
#             binutils->
#               gcc

_vendor='lge'
_codename='hammerhead'
_pkg="android_kernel_${_vendor}_${_codename}"
_pkgname="linux"
_pkgbase="${_pkgname}-api-headers"
pkgname="${_pkgname}-${_codename}-api-headers"
_majver='3.4'
_minver='113'
_linver=20.0
pkgver="${_majver}.${_minver}.l${_linver}"
pkgrel=1
pkgdesc='Kernel headers sanitized for use in userspace'
arch=(
  any
)
url='https://www.gnu.org/software/libc'
license=(
  GPL2
)
makedepends=(
  git
  rsync
)
provides=(
  "${_pkgbase}=${pkgver}"
)
_local="file://${HOME}/${_pkg}"
_http="https://github.com"
_ns="themartiancompany"
_url="${_http}/${_ns}/${_pkg}"
_commit="c802a74b4012c74b0021f610322c338861e2bd56"
source=(
  "${_pkgname}-${pkgver}::git+${_url}#commit=${_commit}"
  # "${_pkgname}-${pkgver}::git+${_local}#commit=${_commit}"
)
sha256sums=(
  'SKIP'
)
validpgpkeys=(
  # Linus Torvalds
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'
  # Greg Kroah-Hartman
  '647F28654894E3BD457199BE38DBBDC86092693E'
)

build() {
  cd \
    "${_pkgname}-${pkgver}"
  make \
    mrproper
}

package() {
  cd \
    "${_pkgname}-${pkgver}"
  make \
    INSTALL_HDR_PATH="${pkgdir}/usr" \
    headers_install

  # use headers from libdrm
  rm \
    -r \
    "${pkgdir}/usr/include/drm"
}

# vim:set sw=2 sts=-1 et:

