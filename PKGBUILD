# Maintainer: everyx <lunt.luo#gmail.com>

pkgname=yacd-ghp-bin
_pkgname=yacd
pkgver=20230212.1
pkgrel=2

pkgdesc='Yet Another Clash Dashboard (prebuild gh-pages)'
arch=('any')
_repo="haishanh/${_pkgname}"
url="https://github.com/${_repo}"
license=('MIT')

makedepends=('git')
optdepends=('clash: A rule-based tunnel in Go'
            'sing-box: The universal proxy platform')
provides=("$_pkgname")
conflicts=("$_pkgname")

source=("${_pkgname}::git+${url}.git#branch=gh-pages")
sha256sums=(SKIP)

pkgver() {
  cd "$_pkgname"
  git log --date=short --pretty=format:%ad | sort | uniq -c | awk '{print $2,$1}' | head -n1 | sed 's/-//g;s/ /./g'
}

package() {
  cd "$_pkgname"

  find . -type f -not -path '*/\.git/*' -exec install -Dm 644 {} "${pkgdir}"/usr/share/"${_pkgname}"/{} \;
}
