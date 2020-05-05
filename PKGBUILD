# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>


pkgname=warpinator
pkgver=1.0.1
pkgrel=1
pkgdesc="Share files across the LAN by Linux Mint"
arch=("x86_64")
url="http://packages.linuxmint.com/pool/main/w/${pkgname}"
license=("GPL")
depends=(
    gtk3
    python-cryptography
    python-gobject
    python-grpcio
    python-protobuf
    python-pynacl
    python-setproctitle
    python-xapp
    python-zeroconf
    xapps
)
depends=(
    grpc
    pygobject-devel
    python-grpcio
    python-setproctitle
    python-xapp
    python-zeroconf
    xapps
)
makedepends=(
    gobject-introspection
    meson
    python-grpcio-tools
)
optdepends=('gufw: Configure firewall rules')
conflicts=(
    lm-warp
    lm-warp-git
    warpinator-git
    warp-git
)
source=("${pkgname}_${pkgver}.tar.xz::${url}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('ad6566a42bdbbcd4039778c8306b1322b161a5e6a382fbc4cf7e9e18d7130500')

prepare() {
	cd "$srcdir/warp"

	# Fix hard-coded libexec dir
	sed -i 's/libexec/lib/g' \
		"bin/warpinator" \
		install-scripts/meson_generate_and_install_protobuf_files.py
}

build() {
    arch-meson warp build
    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
}
