# Maintainer: Peter Hoeg <firstname at lastname dot com>

_pkgbase=toggle.sg-download
pkgname=${_pkgbase}-git
pkgver=r36.5cac3ec
pkgrel=1
pkgdesc='Downloader for toggle.sg'
arch=('any')
url="https://github.com/0x776b7364/${_pkgbase}"
license=('GPL')
source=("git+https://github.com/0x776b7364/${_pkgbase}.git")
depends=('python2' 'ffmpeg')
sha1sums=('SKIP')
_bin=download_toggle_video2.py

pkgver() {
  cd ${srcdir}/${_pkgbase}
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd ${srcdir}/${_pkgbase}
  sed -i ${_bin} -e '1 s/python$/python2/'
}

package() {
  cd ${srcdir}/${_pkgbase}
  install -Dm755 ${_bin} ${pkgdir}/usr/bin/${_bin}
}

# vim:set ts=2 sw=2 et:
