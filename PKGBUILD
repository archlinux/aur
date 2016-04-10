# Maintainer: Maxim Andersson <thesilentboatman@gmail.com> 

pkgname=svtplay-dl-git
_gitname=svtplay-dl
pkgver=1.0.r15.g3487ba6
pkgrel=1
pkgdesc="Media downloader for play sites (e.g. SVT Play)"
arch=('any')
url="https://github.com/spaam/svtplay-dl"
license=('MIT')
depends=('ffmpeg' 'python-crypto' 'python-requests' 'rtmpdump')
makedepends=('git' 'python-setuptools')
provides=('svtplay-dl')
conflicts=('svtplay-dl')
source=('git://github.com/spaam/svtplay-dl.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${_gitname}"

  python setup.py install --root "${pkgdir}" --optimize=1
  install -Dm644 "${srcdir}/${_gitname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${_gitname}"

  /usr/bin/core_perl/pod2man -us 1 -c "${_gitname} manual" -r "${_gitname} ${pkgver}" ${_gitname}.pod ${_gitname}.1
  install -Dm644 "${_gitname}.1" -t "${pkgdir}/usr/share/man/man1"
}

# vim:set ts=2 sw=2 et:
