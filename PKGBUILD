# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor : Fernando "Firef0x" G.P. da Silva <firefgx { aT ) gmail [ d0t } com>

_pkgname=ydcv
pkgname=ydcv-git
epoch=1
pkgver=0.4
pkgrel=1
pkgdesc="YouDao Console Version - Simple wrapper for Youdao online translate (Chinese <-> English) service API, as an alternative to the StarDict Console Version(sdcv) - Git version"
arch=("any")
conflicts=("ydcv")
provides=("ydcv")
url="https://github.com/felixonmars/ydcv"
license=("GPL")
depends=('python')
makedepends=('git')
source=("git+https://github.com/felixonmars/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  # Use un-annotated tags to derive a version number
  git describe --always --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "${_pkgname}"

  # Install bin file
  install -Dm755 ${_pkgname}.py "${pkgdir}/usr/bin/${_pkgname}"

  # Install Z Shell completion script
  install -Dm644 contrib/zsh_completion "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}

# vim:set sts=2 sw=2 ts=2 et:
