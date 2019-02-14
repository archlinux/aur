# Maintainer: Jean-Marc Lenoir <archlinux "at" jihemel "dot" com>
# Contributor: Gavin Lloyd <gavinhungry@gmail.com>

_pkgname=vmware-component-extractor
pkgname=${_pkgname}-git
pkgver=0.2.b3b995a
pkgrel=3
pkgdesc="Extract VMware Tools ISO from component file"
arch=('i686' 'x86_64')
license=('custom')
url='https://github.com/17twenty/VMWare-Component-Extractor'
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
makedepends=('git')
source=("${pkgname}::git+https://github.com/17twenty/VMWare-Component-Extractor#branch=master")
sha256sums=('SKIP')

pkgver () {
  cd "${srcdir}/${pkgname}"
  echo "0.$(git rev-list --count HEAD).$(git describe --always | sed 's|-|.|g')"
}

prepare() {
  cd "${srcdir}/${pkgname}"
  sed -i -e 's/\$(CXX)/\$(CXX) $(CXXFLAGS)/' Makefile
}

build()
{
  cd "${srcdir}/${pkgname}"
  export CXXFLAGS="$CXXFLAGS -std=c++03"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm 755 VMWareComponentExtractor "$pkgdir"/usr/bin/vmware-component-extractor
}
