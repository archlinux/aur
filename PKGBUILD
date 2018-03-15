# Maintainer: Salamandar <felix at piedallu dot me>

_pkgname=git-sizer
pkgname=${_pkgname}-git
pkgver=1.1.0_1_g2e9a30f
pkgrel=1
pkgdesc="Compute various size metrics for a Git repository, flagging those that might cause problems (git version)"
license=('MIT')
arch=('any')

makedepends=(
  'go'
)
depends=(
  'git'
)
conflicts=( "${_pkgname}" "${_pkgname}-bin" )

url="https://github.com/github/${_pkgname}"

source=( "git+${url}" )
sha256sums=('SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe | sed 's/^v//g'  | sed 's/-/_/g'
}

build() {
  cd "${srcdir}/${_pkgname}"

  ./script/bootstrap
  make
}

check() {
  cd "${srcdir}/${_pkgname}"

  make test
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -Dm755 bin/git-sizer  "${pkgdir}/usr/bin/git-sizer"
  install -Dm644 README.md      "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE.md     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 vendor/github.com/spf13/pflag/LICENSE \
                                "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-spf13-pflag"
}
