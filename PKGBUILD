# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

pkgname=python-mypy_protobuf-git
_name=mypy-protobuf
pkgver=v1.13.r32.gf2a078b
pkgrel=1
pkgdesc="Generate mypy stub files from protobuf specs"
arch=(any)
url="https://github.com/dropbox/mypy-protobuf"
license=('Apache')
depends=('python-setuptools' 'python-protobuf')
makedepends=('git')
checkdepends=('python-pytest')
source=("git+https://github.com/dropbox/mypy-protobuf")
sha256sums=('SKIP')

pkgver() {
  cd "$_name"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_name/python"
	python setup.py build
}

#check() {
#	cd "$_name"
#	protoc --python_out=. --mypy_out=. --proto_path=proto/ $(find proto/test -name "*.proto")
#	pytest
#}

package() {
	cd "$_name/python"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
