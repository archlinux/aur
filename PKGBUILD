# Maintainer:Fabian Maurer

pkgname=perf-bfd
pkgver=6.11
pkgrel=1
license=('GPL2')
arch=('x86_64')
url='https://www.kernel.org'
options=('!strip' '!lto')
provides=('perf')
conflicts=('perf')
makedepends=('git' 'asciidoc' 'xmlto' 'perl' 'python' 'python-setuptools' 'slang' 'elfutils' 'libunwind' 'numactl' 'audit' 'zstd' 'libcap' 'libtraceevent' 'openssl' 'clang')
pkgdesc='Linux kernel performance auditing tool (with bfd support)'
depends=('glibc' 'perl' 'python' 'slang' 'elfutils' 'libunwind' 'binutils' 'numactl' 'audit' 'coreutils' 'glib2' 'xz' 'zlib' 'libelf' 'bash' 'zstd' 'libcap' 'libtraceevent' 'openssl' 'libsframe.so')

source=("https://github.com/torvalds/linux/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0c77f16700b91249489b8c3888f824c0961687b0eff1e88e74aec2b09b9c33bf')

build()
{
    cd linux-${pkgver}/tools/perf
    make -f Makefile.perf \
        prefix=/usr \
        lib=lib/perf \
        perfexecdir=lib/perf \
        WERROR=0 \
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
        WERROR=0 \
        NO_SDT=1 \
        BUILD_BPF_SKEL=1 \
        PYTHON=python \
        PYTHON_CONFIG=python-config \
        DESTDIR="$pkgdir" \
        BUILD_NONDISTRO=1 \
        install install-python_ext
}
