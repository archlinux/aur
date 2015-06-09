# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: Carlos Franke <carlos_franke at lemtank dot de>

pkgname='opa-git'
pkgver=4308.r80.g63f1cda
pkgrel=1
pkgdesc="A new generation of open source web development framework for JavaScript"
arch=('i686' 'x86_64')
url="https://github.com/MLstate/opalang/"
license=('AGPL3' 'MIT')
groups=('devel')
provides=('opa')
conflicts=('opa')
options=('!strip')
depends=('java-environment' 'openssl' 'nodejs' 'mongodb')
makedepends=('git' 'ocaml' 'ocaml-ulex' 'ocaml-zip' 'ocaml-ocamlgraph'
             'ocaml-cryptokit' 'ocaml-ssl' 'java-runtime' 'perl')
optdepends=('couchdb')
_git_module_name=opalang
source=("$_git_module_name::git+https://github.com/MLstate/opalang.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_git_module_name"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_git_module_name"
  ./configure -prefix /usr
  make
}

package() {
  cd "$srcdir/$_git_module_name"
  make DESTDIR="$pkgdir/" install
  install -Dm644 doc/MIT-LICENSE "$pkgdir/usr/share/licenses/$pkgname/MIT-LICENSE"
}

# vim:set ts=2 sw=2 et:
