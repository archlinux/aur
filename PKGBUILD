# Maintainer: Tree Davies <tdavies.aur@darkphysics.net>
# SPDX-License-Identifier: GPL-2.0-or-later

pkgname=udon
pkgver=0.066
pkgrel=1
epoch=0
pkgdesc="Minimalistic CLI based End to End Encrypted (E2EE) message passing tool/service."
arch=('any')
url="https://github.com/treedavies/udon"
license=('GPL2')
groups=()
depends=('openssl' 'python-psutil' 'python-beautifulsoup4' 'python-cffi'  'python-cryptography' 'python-daemon'  'protobuf' 'python-grpcio' 'python-grpcio-tools' 'grpc')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools>=40.8.0' 'python-wheel')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/treedavies/udon/archive/refs/tags/udon-v0.066.tar.gz")
noextract=()
sha256sums=("5cd6eab2576b5ccdd1a895c7ea832144c16f88224bf8ca64fb0a6332b5e200f3")
validpgpkeys=()

build() {
	cd "udon-$pkgname-v$pkgver"

	# BUILD PROTOBUFFERS
	PROTO_PATH="src/udon"
	/usr/bin/python3 -m grpc_tools.protoc --proto_path=$PROTO_PATH udon.proto --python_out=$PROTO_PATH --grpc_python_out=$PROTO_PATH

	python -m build --wheel --no-isolation
}

package() {
	cd "udon-$pkgname-v$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	chmod +x "$pkgdir"/usr/lib/python3.14/site-packages/udon/udon.py 
}


