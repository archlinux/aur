# Maintainer: Chris Trotman <chris+aur@trotman.io>

pkgname=ec2-fzf
pkgver=1.0
pkgrel=1
pkgdesc="Quickly get the address details of ec2 instances"
url='https://github.com/solarnz/ec2-fzf'
arch=('x86_64')
license=('MIT')
makedepends=('go' 'git')
conflicts=('ec2-fzf-bin')
_gourl=github.com/solarnz
source=("${pkgname}::git+https://${_gourl}/${pkgname}.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
  mkdir -p "${srcdir}/src/${_gourl}"
  rm -rf "${srcdir}/src/${_gourl}/${pkgname}"
  mv -f "${pkgname}" "${srcdir}/src/${_gourl}/${pkgname}"
}

build() {
  msg2 "Build program"
  cd "${srcdir}/src/${_gourl}/${pkgname}"
  cd "cmd/ec2-fzf"
  GOPATH="${srcdir}" PATH="${srcdir}/bin:${PATH}" go install
}

package() {
  cd "${srcdir}/bin"
  install -Dm755 ec2-fzf "${pkgdir}/usr/bin/ec2-fzf"
}
