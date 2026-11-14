# Maintainer: Tree Davies <tdavies.aur@darkphysics.net>
# SPDX-License-Identifier: GPL-2.0-or-later

pkgname=udon
pkgver=0.062
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
source=("https://github.com/treedavies/udon/archive/refs/tags/udon-v0.062.tar.gz")
noextract=()
sha256sums=("ea42a99bc6f88f14858b3aa89e991eddf310b5db86893b76ec26122806d48aab")
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
	cp -r src/modules "$pkgdir"/usr/bin/udon.d
	install -m 755 -o root src/udon.proto "$pkgdir"/usr/bin/udon.d

	# BUILD PROTOBUFFERS	
	PROTO_PATH="$pkgdir/usr/bin/udon.d/"
	/usr/bin/python3 -m grpc_tools.protoc --proto_path=$PROTO_PATH udon.proto --python_out=$PROTO_PATH --grpc_python_out=$PROTO_PATH

}


