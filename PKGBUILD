# Maintainer:Fabian Maurer

pkgname=perf-bfd
pkgver=6.6
pkgrel=1
license=('GPL2')
arch=('x86_64')
url='https://www.kernel.org'
options=('!strip' '!lto')
profides='perf'
conflicts=('perf')
makedepends=('git' 'asciidoc' 'xmlto' 'perl' 'python' 'python-setuptools' 'slang' 'elfutils' 'libunwind' 'numactl' 'audit' 'zstd' 'libcap' 'libtraceevent' 'openssl' 'clang')
pkgdesc='Linux kernel performance auditing tool (with bfd support)'
depends=('glibc' 'perl' 'python' 'slang' 'elfutils' 'libunwind' 'binutils' 'numactl' 'audit' 'coreutils' 'glib2' 'xz' 'zlib' 'libelf' 'bash' 'zstd' 'libcap' 'libtraceevent' 'openssl' 'libsframe.so')

source=("https://github.com/torvalds/linux/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9a72c005a62f109f96ee00552502d16c4f06c248e6baba1629506627396ac0a7')

build()
{
    cd linux-${pkgver}/tools/perf
    make -f Makefile.perf \
        prefix=/usr \
        lib=lib/perf \
        perfexecdir=lib/perf \
        EXTRA_CFLAGS=' -Wno-error=bad-function-cast -Wno-error=declaration-after-statement -Wno-error=switch-enum' \
        NO_SDT=1 \
        BUILD_BPF_SKEL=1 \
        PYTHON=python \
        PYTHON_CONFIG=python-config \
        DESTDIR="$pkgdir" \
        BUILD_NONDISTRO=1
}

package()
{
 
    cd linux-${pkgver}/tools/perf
    make -f Makefile.perf \
        prefix=/usr \
        lib=lib/perf \
        perfexecdir=lib/perf \
        EXTRA_CFLAGS=' -Wno-error=bad-function-cast -Wno-error=declaration-after-statement -Wno-error=switch-enum' \
        NO_SDT=1 \
        BUILD_BPF_SKEL=1 \
        PYTHON=python \
        PYTHON_CONFIG=python-config \
        DESTDIR="$pkgdir" \
        BUILD_NONDISTRO=1 \
        install install-python_ext
}
