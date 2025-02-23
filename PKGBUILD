# Maintainer: taotieren <admin@taotieren.com>

pkgbase=nanomq-git
pkgname=(nanomq{,-sqlite,-msquic,-full}-git)
pkgver=0.23.2.r23.geabdfde3
pkgrel=2
pkgdesc="Nano MQTT Broker - An Ultra-light and Blazing-fast MQTT Broker for IoT Edge"
arch=($CARCH)
url="https://github.com/nanomq/nanomq"
license=('MIT')
provides=(
    ${pkgbase%-git}
    nanonng
    nng
)
conflicts=(${pkgbase%-git})
depends=(
    mbedtls
    python
)
makedepends=(
    asciidoctor
    boost
    cmake
    gcc
    git
    ninja
    sqlite
    vector
    vector-blf
    zeromq
)
backup=(
    etc/nanomq.conf
    etc/nanomq_acl.conf
    etc/nanomq_bridge.conf
    etc/nanomq_dds_gateway.conf
    etc/nanomq_example.conf
    etc/nanomq_old.conf
    etc/nanomq_pwd.conf
    etc/nanomq_vsomeip_gateway.conf
    etc/nanomq_zmq_gateway.conf
)
options=('!strip' '!lto')
source=(
    "${pkgname%-git}::git+${url}.git"
    #     "nng::git+https://github.com/nanomq/NanoNNG.git"
    #     "l8w8jwt::git+https://github.com/GlitchedPolygons/l8w8jwt.git"
    #     "nftp-codec::git+https://github.com/nanomq/nftp-codec.git"
    #     "msquic::git+https://github.com/microsoft/msquic.git"
    #     "mbedtls::git+https://github.com/ARMmbed/mbedtls.git"
    #     "chillbuff::git+https://github.com/GlitchedPolygons/chillbuff.git"
    #     "jsmn::git+https://github.com/zserge/jsmn.git"
    #     "checknum::git+https://github.com/GlitchedPolygons/checknum.git"
    #     "acutest::git+https://github.com/mity/acutest.git"
    #     "ed25519::git+https://github.com/GlitchedPolygons/GlitchEd25519.git"
    #     "doxygen-awesome::git+https://github.com/GlitchedPolygons/doxygen-awesome-css.git"
    #     "googletest::git+https://github.com/google/googletest.git"
    #     "openssl::git+https://github.com/quictls/openssl.git"
    #     "clog::git+https://github.com/microsoft/CLOG.git"
    #     "xdp-for-windows::git+https://github.com/microsoft/xdp-for-windows.git"
)
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgbase%-git}/"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    #     git -C "${srcdir}/openssl/" clean -dfx
    #     cd "${srcdir}/openssl/"
    #     git submodule update --init --recursive
    #     #     git submodule init
    #     #     git config submodule.submodules/googletest.url "$srcdir/googletest"
    #     #     git -c protocol.file.allow=always submodule update
    #
    #     git -C "${srcdir}/xdp-for-windows/" clean -dfx
    #     cd "${srcdir}/xdp-for-windows/"
    #     git submodule update --init --recursive
    #     #     git submodule init
    #     #     git config submodule.submodules/googletest.url "$srcdir/googletest"
    #     #     git -c protocol.file.allow=always submodule update
    #
    #     git -C "${srcdir}/msquic/" clean -dfx
    #     cd "${srcdir}/msquic/"
    #     #     git submodule update --init --recursive
    #     git submodule init
    #     git config submodule.submodules/googletest.url "$srcdir/googletest"
    #     git config submodule.submodules/openssl.url "$srcdir/openssl"
    #     git config submodule.submodules/openssl3.url "$srcdir/openssl"
    #     git config submodule.submodules/clog.url "$srcdir/clog"
    #     git config submodule.submodules/xdp-for-windows.url "$srcdir/xdp-for-windows"
    #     git -c protocol.file.allow=always submodule update
    #
    #     git -C "${srcdir}/nng/" clean -dfx
    #     cd "${srcdir}/nng/"
    #     #     git submodule update --init --recursive
    #     git submodule init
    #     git config submodule.extern/msquic.url "$srcdir/msquic"
    #     git -c protocol.file.allow=always submodule update
    #
    #     git -C "${srcdir}/l8w8jwt/" clean -dfx
    #     cd "${srcdir}/l8w8jwt/"
    #     #     git submodule update --init --recursive
    #     git submodule init
    #     git config submodule.lib/mbedtls.url "$srcdir/mbedtls"
    #     git config submodule.lib/chillbuff.url "$srcdir/chillbuff"
    #     git config submodule.lib/jsmn.url "$srcdir/jsmn"
    #     git config submodule.lib/checknum.url "$srcdir/checknum"
    #     git config submodule.lib/acutest.url "$srcdir/acutest"
    #     git config submodule.lib/ed25519.url "$srcdir/ed25519"
    #     git config submodule.lib/doxygen-awesome.url "$srcdir/doxygen-awesome"
    #     git -c protocol.file.allow=always submodule update
    #
    #     git -C "${srcdir}/chillbuff/" clean -dfx
    #     cd "${srcdir}/chillbuff/"
    #     #     git submodule update --init --recursive
    #     git submodule init
    #     git config submodule.lib/doxygen-awesome.url "$srcdir/doxygen-awesome"
    #     git -c protocol.file.allow=always submodule update

    #     git -C "${srcdir}/${pkgbase%-git}/" clean -dfx
    cd "${srcdir}/${pkgbase%-git}/"
    git submodule update --init --recursive
    #     git submodule init
    #     git config submodule.nanonng.url "$srcdir/nng"
    #     git config submodule.extern/l8w8jwt.url "$srcdir/l8w8jwt"
    #     git config submodule.nanomq_cli/nftp-codec.url "$srcdir/nftp-codec"
    #     git -c protocol.file.allow=always submodule update
}

package_nanomq-git() {
    pkgdesc+=" (base Broker)"
    provides+=(${pkgname%-git})

    cd "${srcdir}/${pkgbase%-git}/"
    cmake -DCMAKE_BUILD_TYPE=None \
        -DNNG_ENABLE_TLS=ON \
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev \
        -B build_nanomq \
        -G Ninja

    ninja -C build_nanomq

    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgbase%-git}/build_nanomq install
    mv "${pkgdir}"/usr/etc "${pkgdir}"/
}

package_nanomq-sqlite-git() {
    pkgdesc+=" (sqlite Broker)"
    provides+=(${pkgname%-git})

    cd "${srcdir}/${pkgbase%-git}/"
    cmake -DCMAKE_BUILD_TYPE=None \
        -DNNG_ENABLE_TLS=ON \
        -DNNG_ENABLE_SQLITE=ON \
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev \
        -B build_nanomq-sqlite \
        -G Ninja

    ninja -C build_nanomq-sqlite

    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgbase%-git}/build_nanomq-sqlite install
    mv "${pkgdir}"/usr/etc "${pkgdir}"/
}

package_nanomq-msquic-git() {
    pkgdesc+=" (msquic Broker)"
    provides+=(${pkgname%-git})
    conflicts=(msquic)

    #         -DNNG_ENABLE_QUIC=ON \

    cd "${srcdir}/${pkgbase%-git}/"
    cmake -DCMAKE_BUILD_TYPE=None \
        -DNNG_ENABLE_TLS=ON \
        -DNNG_ENABLE_SQLITE=ON \
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev \
        -B build_nanomq-msquic \
        -G Ninja

    ninja -C build_nanomq-msquic

    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgbase%-git}/build_nanomq-msquic install
    mv "${pkgdir}"/usr/etc "${pkgdir}"/
}

package_nanomq-full-git() {
    pkgdesc+=" (full Broker)"
    provides+=(
        ${pkgname%-git}
        l8w8jwt
    )
    conflicts=(
        msquic
        mbedtls
    )
    depends=(
        mbedtls
        python
    )

    cd "${srcdir}/${pkgbase%-git}/"
    cmake -DCMAKE_BUILD_TYPE=None \
        -DNNG_ENABLE_TLS=ON \
        -DNNG_ENABLE_SQLITE=ON \
        -DNNG_ENABLE_SQLITE=ON \
        -DENABLE_RULE_ENGINE=ON \
        -DENABLE_JWT=ON \
        -DBUILD_ZMQ_GATEWAY=ON \
        -DBUILD_BENCH=ON \
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev \
        -B build_nanomq-full \
        -G Ninja

    ninja -C build_nanomq-full

    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgbase%-git}/build_nanomq-full install
    mv "${pkgdir}"/usr/etc "${pkgdir}"/
}
