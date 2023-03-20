# Maintainer: everyx <lunt.luo#gmail.com>

pkgname=yacd-git
_pkgname=yacd
pkgver=0.3.8.r20.g0b254f1
pkgrel=1

pkgdesc='Yet Another Clash Dashboard'
arch=('any')
_repo="haishanh/${_pkgname}"
url="https://github.com/${_repo}"
license=('MIT')

makedepends=('git' 'pnpm')
optdepends=('clash: A rule-based tunnel in Go'
            'sing-box: The universal proxy platform')
provides=("$_pkgname")
conflicts=("$_pkgname")

source=("${_pkgname}::git+${url}.git#branch=master")
sha256sums=(SKIP)

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build () {
  cd "$_pkgname"
  pnpm i && pnpm build
}

package() {
  cd "$_pkgname/public"

  find . -type f -exec install -Dm 644 {} "${pkgdir}"/usr/share/"${_pkgname}"/{} \;
}
