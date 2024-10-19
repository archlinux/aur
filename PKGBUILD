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
sha256sums=('87eebb4c5d35b5c71e2b1dbdd106be6e6ccc0ee3c3ba0602a3fc4d9d169a6b93')

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
