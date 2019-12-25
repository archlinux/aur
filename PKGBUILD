# Maintainer: peeweep <peeweep at 0x0 dot ee>

pkgname=sherlock-git
pkgver=20191224.3eb478e
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
  'python-torrequest'
)
makedepends=('git')
source=(
  "${pkgname}::git+${url}.git"
  "sherlock.sh"
)
sha256sums=('SKIP'
            '45bb5034d63681f3e0f0d12f868465024a473b12b2751b00e968fcb7a935497c')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git log -1 --format='%cd.%h' --date=short | tr -d -
}

package() {
  install -Dm755 "${srcdir}/sherlock.sh" "${pkgdir}/usr/bin/sherlock"
  install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/sherlock/LICENSE"
  cp -r "${srcdir}/${pkgname}" "${pkgdir}/usr/share/sherlock"
}

# vim:set ts=2 sw=2 et:
