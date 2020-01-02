pkgname=virtkvm-git
pkgver=r7.d47e571
pkgrel=1
pkgdesc="A virtual KVM switch"
arch=('i686' 'x86_64')
url="https://github.com/alexbakker/virtkvm.git"
license=('GPL')
depends=('ddcutil' 'python-flask' 'libvirt-python' 'python-pyaml' 'python-xmltodict')
makedepends=('git')
conflicts=('virtkvm')
provides=('virtkvm')
# The git repo is detected by the 'git:' or 'git+' beginning. The branch
# '$pkgname' is then checked out upon cloning, expediating versioning:
#source=('git+https://github.com/falconindy/expac.git'
source=("$pkgname"::'git://github.com/alexbakker/virtkvm.git')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  python ./setup.py build
}

package() {
  cd "$pkgname"
  python ./setup.py install --root="$pkgdir/" --optimize=1
}
