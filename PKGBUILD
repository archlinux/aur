# Maintainer:
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=grumpy
pkgver=0.1
pkgrel=3
pkgdesc='Python to Go transpiler and Python interpreter'
arch=('x86_64')
license=('Apache')
url='https://github.com/google/grumpy'
options=('!strip')
depends=('python2')
makedepends=('go-pie' 'git')
optdepend=('go: compile sources with Go'
           'go-pie: compile sources with Go (PIE)'
           'gcc-go: compile sources with gcc-go')
source=("git+https://github.com/google/grumpy.git#commit=2c8ff4b377ebb6455cf81ef8b7a4ec6cd435ed61")
md5sums=('SKIP')

prepare() {
  # https://github.com/google/grumpy/issues/378
  find "$srcdir" -type f -name "*.go" -exec sed -i 's:const _ =:const _x =:g' '{}' \;
}

build() {
  make -C grumpy
}

package() {
  DESTDIR="$pkgdir" make -C grumpy install
}

# vim: ts=2 sw=2 et:
