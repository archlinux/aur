# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=rockchip-mpp
pkgver=20171218
pkgrel=2
pkgdesc='Rockchip Media Process Platform (MPP)'
arch=('i686' 'x86_64')
url='https://github.com/rockchip-linux/mpp/'
license=('APACHE')
depends=('gcc-libs')
makedepends=('cmake')
options=('!staticlibs')
source=("${pkgname}-${pkgver}".tar.gz::"https://github.com/rockchip-linux/mpp/archive/release_${pkgver}.tar.gz")
sha256sums=('03b4f093e23fa480c3c46a07059fb297d352e5b3d050f4da4869c1ade8adc125')

build() {
    cd "mpp-release_${pkgver}"
    
    cmake \
        -DAVSD_TEST:BOOL='OFF' \
        -DCMAKE_BUILD_TYPE:STRING='Release' \
        -DCMAKE_COLOR_MAKEFILE:BOOL='ON' \
        -DCMAKE_INSTALL_BINDIR:PATH='bin' \
        -DCMAKE_INSTALL_DATAROOTDIR:PATH='share' \
        -DCMAKE_INSTALL_INCLUDEDIR:PATH='include' \
        -DCMAKE_INSTALL_LIBDIR:PATH='lib' \
        -DCMAKE_INSTALL_LOCALSTATEDIR:PATH='var' \
        -DCMAKE_INSTALL_MANDIR:PATH='share/man' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_INSTALL_SBINDIR:PATH='sbin' \
        -DCMAKE_INSTALL_SYSCONFDIR:PATH='/etc' \
        -DENABLE_AVSD:BOOL='ON' \
        -DENABLE_H263D:BOOL='ON' \
        -DENABLE_H264D:BOOL='ON' \
        -DENABLE_H264E:BOOL='ON' \
        -DENABLE_H265D:BOOL='ON' \
        -DENABLE_JPEGD:BOOL='ON' \
        -DENABLE_JPEGE:BOOL='ON' \
        -DENABLE_MPEG2D:BOOL='ON' \
        -DENABLE_MPEG4D:BOOL='ON' \
        -DENABLE_VP8D:BOOL='ON' \
        -DENABLE_VP9D:BOOL='ON' \
        -DH264D_TEST:BOOL='OFF' \
        -DH265D_TEST:BOOL='OFF' \
        -DJPEGD_TEST:BOOL='OFF' \
        -DMPI_DEC_TEST:BOOL='OFF' \
        -DMPI_ENC_TEST:BOOL='OFF' \
        -DMPI_RC2_TEST:BOOL='OFF' \
        -DMPI_RC_TEST:BOOL='OFF' \
        -DMPI_TEST:BOOL='OFF' \
        -DMPP_BUFFER_TEST:BOOL='OFF' \
        -DMPP_ENV_TEST:BOOL='OFF' \
        -DMPP_INFO_TEST:BOOL='OFF' \
        -DMPP_LOG_TEST:BOOL='OFF' \
        -DMPP_MEM_TEST:BOOL='OFF' \
        -DMPP_PACKET_TEST:BOOL='OFF' \
        -DMPP_PLATFORM_TEST:BOOL='OFF' \
        -DMPP_TASK_TEST:BOOL='OFF' \
        -DMPP_THREAD_TEST:BOOL='OFF' \
        -DRKPLATFORM:BOOL='ON' \
        -DVP9D_TEST:BOOL='OFF' \
        -DVPU_API_TEST:BOOL='OFF' \
        -Wno-dev \
        .
    
    make
}

package() {
    cd "mpp-release_${pkgver}"
    
    make DESTDIR="$pkgdir" install
    
    # remove static libs that are not removed by '!staticlibs' option
    rm -f "$pkgdir"/usr/lib/*.a
}
