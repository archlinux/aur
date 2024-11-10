# Maintainer: Hazel Atkinson <yellowsink@riseup.net>

pkgname=capnproto-dlang
pkgver=0.1.2.7a48c3b
pkgrel=1
pkgdesc="Cap'n Proto compiler for D"
arch=("any")
url="https://github.com/capnproto/capnproto-dlang"
license=("MIT")
groups=()
depends=("capnproto" "libphobos")
makedepends=("dub" "dmd")
source=("capnp-src.tar.gz::https://github.com/capnproto/capnproto-dlang/archive/7a48c3ba4def5487d8d282ec894c07ff30d588be.tar.gz")
sha256sums=("f8246ad32e3bd82661c64427e2070868a86048c8b3f908d7890f7addcfbe0787")

build() {
	cd "capnproto-dlang-"*

	# build
	make

	# purposefully don't build libcapnproto-dlang.a as you should be using dub to build it.
	#dub build -b release
}

package() {
	cd "capnproto-dlang-"*

	# put binary into place
	install -Dm 755 capnpc-dlang "${pkgdir}/usr/bin/capnpc-dlang"

	# put capnp schema into place
	install -Dm 644 "compiler/src/main/schema/capnp/dlang.capnp" "${pkgdir}/usr/include/capnp/dlang.capnp"

	# we did not build libcapnproto-dlang.a
	# install -Dm 644 libcapnproto-dlang.a "${pkgdir}/usr/lib/libcapnproto-dlang.a"
}
