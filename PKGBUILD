# Maintainer: bobpaul <aurpackage [at] bobpaul 'period' org>
_pkgname="Obfuscation-Tunnel"
pkgname="${_pkgname,,}-git"
pkgver=r80.cbd31a1
pkgrel=2
epoch=
pkgdesc="Obfuscate UDP traffic to hide from deep packet inspection"
arch=('x86_64' 'aarch64')
url="https://github.com/RoliSoft/${_pkgname}"
license=('BSD')
groups=()
depends=('libpcap' 'libssl.so=3' 'libcrypto.so=3' 'glibc')
makedepends=('git' 'gcc' 'make')
checkdepends=()
optdepends=()
provides=('obfuscation-tunnel')
conflicts=('obfuscation-tunnel')
replaces=()
backup=()
options=()
install=
changelog=
source=(git+${url}.git 'ctypes.patch')
noextract=()
sha256sums=('SKIP'
            '4eba65b38359124c8d8c6aa9c8b2e91b8b9bf8e6f77f7ca824eebb393e42dd3d')
validpgpkeys=()

builddir=${_pkgname}
prepare() {
    cd "$builddir"
    patch -p1 -i "$srcdir/ctypes.patch"
}


build() {
    cd "$builddir"
	make
}

pkgver(){
	cd "$builddir"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

check() {
	echo $pwd
#cd "$builddir"
}

package() {
	cd "$builddir"
	install -D -m755 tunnel "${pkgdir}/usr/bin/${pkgname/-git/}"
	install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
