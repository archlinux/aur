# Maintainer : adytzu2007 <adybac at gmail {dot} com>

pkgname=serf-git
_pkgver=0.5
pkgver=0.6.4.r12.g320787d
pkgrel=1
pkgdesc="Service discovery and orchestration"
arch=('i686' 'x86_64')
url=("http://www.serfdom.io/")
license=('MPL')
makedepends=('go')
_gitroot='https://github.com/hashicorp/serf.git'
_gitname='serf'
_gitbranch='master'
source=("${_gitname}::git+${_gitroot}#branch=${_gitbranch}")
sha256sums=("SKIP")

build()
{
    cd "${srcdir}"

    # create a temporary go workspace
    mkdir -p src bin
    export GOPATH="${PWD}"

    cd "${srcdir}/src/${_gitname}"
    make
}

package()
{
  install -D -m755 "${srcdir}/bin/serf" "${pkgdir}/usr/bin/serf"
}

pkgver()
{
    cd "$srcdir/${_gitname}"
    git describe --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g' | cut -c2-
}
