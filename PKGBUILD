# Maintainer: peeweep <peeweep at 0x0 dot ee>

pkgname=sherlock-git
_pkgname=sherlock
pkgver=20191002.d8290d5
pkgrel=1
pkgdesc="Find usernames across social networks"
arch=('any')
url="https://github.com/sherlock-project/sherlock"
license=('MIT')
depends=(
  'python-beautifulsoup4'
  'python-certifi'
  'python-colorama'
  'python-lxml'
  'python-pysocks'
  'python-requests'
  'python-requests-futures'
  'python-soupsieve'
  'python-stem'
)
makedepends=('git')
source=(
  "${_pkgname}::git+${url}.git"
  "sherlock.sh"
)
sha256sums=('SKIP'
  'a50fa6f5b78be38e0cb63fd6069df971d27a3ee31bf699af254d6cc869cb2151')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git log -1 --format='%cd.%h' --date=short | tr -d -
}

package() {
  install -Dm755 "${srcdir}/sherlock.sh" "${pkgdir}/usr/bin/sherlock.sh"
  cp -r "${srcdir}/${_pkgname}" "${pkgdir}/usr/share/${_pkgname}"
  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
