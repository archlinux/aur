pkgver=4.5.2
pkgname=cpu-x-bin
pkgdesc='A Free software that gathers information on CPU, motherboard and more, prebuilt, with ARM64 support'
pkgrel=1.5
arch=(x86_64 aarch64)
provides=(cpu-x)
conflicts=(cpu-x)
url='https://thetumultuousunicornofdarkness.github.io/CPU-X'
license=('GPL3')
depends=('gtkmm3' 'ncurses' 'libcpuid>=0.6.0' 'pciutils' 'glfw' 'vulkan-icd-loader' 'procps-ng>=4.0.0' 'libprocps')
makedepends=('patchelf')
optdepends=('opengl-driver: packaged openGL driver'
            'vulkan-driver: packaged Vulkan driver')
_mirror='http://download.opensuse.org'
_opensuse_version='leap/15.5'
_bpver=155

_get_source() {
    echo "${_mirror}/distribution/${_opensuse_version}/repo/oss/${1}/cpu-x-${pkgver}-bp${_bpver}.${pkgrel}.${1}.rpm"
}

source=('io.github.thetumultuousunicornofdarkness.cpu-x.desktop')
source_x86_64=(`_get_source x86_64`)
source_aarch64=(`_get_source aarch64`)
sha256sums=('SKIP')
sha256sums_x86_64=('cf8fe68806f7df58bb8a18fb4f2774d82850d6e651ef4c366dc0a9887511f908')
sha256sums_aarch64=('bb31012ac5d4aa294521fd49f6d99775768dbdadc928fa47053f0fc041b88043')

package() {
    mkdir -p "$srcdir/usr/share/applications"
    patchelf --replace-needed libprocps.so.7 libprocps.so "$srcdir/usr/bin/cpu-x"
    mv io.github.thetumultuousunicornofdarkness.cpu-x.desktop "$srcdir/usr/share/applications"
	mv usr "$pkgdir"
}
