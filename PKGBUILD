# Maintainer: Tree Davies <tdavies.aur@darkphysics.net>
# SPDX-License-Identifier: GPL-2.0-or-later

pkgname=udon
pkgver=0.063
pkgrel=1
epoch=1
pkgdesc="Minimalistic CLI based End to End Encrypted (E2EE) message passing tool/service."
arch=('any')
url="https://github.com/treedavies/udon"
license=('GPL')
groups=()
depends=('openssl' 'python-psutil' 'python-beautifulsoup4' 'python-cffi'  'python-cryptography' 'python-daemon'  'protobuf' 'python-grpcio' 'python-grpcio-tools' 'grpc')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/treedavies/udon/archive/refs/tags/udon-v0.063.tar.gz")
noextract=()
sha256sums=("e2c53d3f0d5ed6d603b765e437f7b8c4e9f3a3317975978add4a2afa79557ccf")
validpgpkeys=()

package() {
	cd "udon-$pkgname-v$pkgver"

	# Crate Directories and INSTALL FILES
	install -d -m 755 -o root "$pkgdir"/usr/bin/udon.d
	install -m 755 -o root ./src/udon "$pkgdir"/usr/bin/udon.d
	ln -s /usr/bin/udon.d/udon "$pkgdir"/usr/bin/udon

	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -m 755 -o root src/libudon.py "$pkgdir"/usr/bin/udon.d
	install -m 755 -o root src/test_libudon.py "$pkgdir"/usr/bin/udon.d
	install -m 755 -o root src/udon_init.py "$pkgdir"/usr/bin/udon.d
	install -m 755 -o root src/udon.proto "$pkgdir"/usr/bin/udon.d

	# BUILD PROTOBUFFERS	
	PROTO_PATH="$pkgdir/usr/bin/udon.d/"
	/usr/bin/python3 -m grpc_tools.protoc --proto_path=$PROTO_PATH udon.proto --python_out=$PROTO_PATH --grpc_python_out=$PROTO_PATH

}


