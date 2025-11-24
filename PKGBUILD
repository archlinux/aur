# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>
# based on pacman-static of Eli Schwartz <eschwartz@archlinux.org>

pkgname=libarchive-static
_pkgname=libarchive
pkgver=3.8.3
pkgrel=2
_attrver=2.5.2
_aclver=2.3.2
_sslver=3.6.0
_zlibver=1.3.1
_xzver=5.8.1
_bzipver=1.0.8
_zstdver=1.5.7
pkgdesc='Statically-compiled bsdtar (Multi-format archive and compression library, to fix badly broken systems)'
arch=('i486' 'i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://libarchive.org/'
license=('BSD')
makedepends=('musl' 'kernel-headers-musl' 'git')
options=('!emptydirs' '!lto')
validpgpkeys=('DB2C7CF1B4C265FAEF56E3FC5848A18B8F14184B'  # Martin Matuska <martin@matuska.org>
              '659C84C0E23EA1FA97E0B58CC040B508D63D2B36') # Martin Matuska <mm@FreeBSD.org>
source=("git+https://github.com/${_pkgname}/${_pkgname}.git?signed#tag=v${pkgver}"
       "libarchive-3.8.3-all-static.patch")

sha512sums=('4e6d6c58a7012db2c950e617aa9df100de1ee3ed3b13b6ea2ebeda188af49150d1c0cde2cf64125b656b358143e12011af75a1b7dc02c1c0b00cbbad6d444432'
            '8478795f3d980073128c31ddd388a113c55d7d2ecc60ccb0488edf5b34d5156f5e773d62a61083dedd5333ef71613d5af619e1dcf2d9acea372c76746b16f879'
            'f587ea544effb7cfed63b3027bf14baba2c2dbe3a9b6c0c45fc559f7e8cb477b3e9a4a826eae30f929409468c50d11f3e7dc6d2500f41e1af8662a7e96a30ef3'
            'SKIP'
            '6e6588e75c4868bac104496a6709f2874e39b81deff2d5d05706039d6e67fbc5bcd0100bdb0aa840a0e09f99443b1d4fa0a44bd4d5d334f7ae57916c1aee4875'
            '31aeb39958d8af5d08933dd3a89333a41025c3eb49fc461fa3c291caca51dad575ec13faeb7deba9b3c2ebf7615be7d45e2b78e50d4f83d8ec933c95931a7682'
            'SKIP'
            '866825a1cdf0b705b409402fbc7a713e7d9b8e7736c5126be57b354927954c148a341fc52b02c0629c1e015a889bfd40217f8e703b73235892e91da060909b76'
            'SKIP'
            'b1873dbb7a49460b007255689102062756972de5cc2d38b12cc9f389b6be412da6797579b1acd3717a8cd2ee118fd9801b94e55f063d4328f050f0876a5eb53c'
            'b5887ea77417fae49b6cb1e9fa782d3021f268d5219701d87a092235964f73fa72a31428b630445517f56f2bb69dcbbb24119ef9dbf8b4e40a753369a9f9a16f'
            '580677aad97093829090d4b605ac81c50327e74a6c2de0b85dd2e8525553f3ddde17556ea46f8f007f89e435493c9a20bc997d1ef1c1c2c23274528e3c46b94f'
            'SKIP'
            'b9a0f746215cd93c04fecd390ca44fc281d892b989e740ec6abbaa6a1eb457bbef40a33596dfe6e2285a319f2b09ae1994d778f0cf61114cbee9454a0eaa754b'
            '083f5e675d73f3233c7930ebe20425a533feedeaaa9d8cc86831312a6581cefbe6ed0d08d2fa89be81082f2a5abdabca8b3c080bf97218a1bd59dc118a30b9f3'
            'SKIP'
            '2af02be3df319556b65403450acc55964d971fe263fed87dea823fb264a862db807a2a3d89358564277a83e5b303302cc677f66b5e523e3d224120b884e5ef1b'
            'SKIP')
# i486, shasumming git archives is broken?
if [ "${CARCH}" = "i486" ]; then
	sha512sums[6]='SKIP'
	sha512sums[12]='SKIP'
fi

_backports=(
)

_reverts=(
)

# attr
source+=("https://download.savannah.gnu.org/releases/attr/attr-${_attrver}.tar.xz"{,.sig}
         "attr-2.5.2-basename-libgen.patch")
validpgpkeys+=('600CD204FBCEA418BD2CA74F154343260542DF34'  # Brandon Philips <brandon@ifup.co>
              'B902B5271325F892AC251AD441633B9FE837F581'  # Frysinger <vapier@gentoo.org>
              '259B3792B3D6D319212CC4DCD5BF9FEB0313653A') # Andreas Gruenbacher <andreas.gruenbacher@gmail.com>

# acl
source+=("https://download.savannah.gnu.org/releases/acl/acl-${_aclver}.tar.gz"{,.sig})
validpgpkeys+=('600CD204FBCEA418BD2CA74F154343260542DF34'  # Brandon Philips <brandon@ifup.co>
              'B902B5271325F892AC251AD441633B9FE837F581'  # Frysinger <vapier@gentoo.org>
              '259B3792B3D6D319212CC4DCD5BF9FEB0313653A') # Andreas Gruenbacher <andreas.gruenbacher@gmail.com>

# openssl
source+=("https://github.com/openssl/openssl/releases/download/openssl-${_sslver}/openssl-${_sslver}.tar.gz"{,.asc}
         "ca-dir.patch"
         "openssl-3.0.7-no-atomic.patch")
validpgpkeys+=('8657ABB260F056B1E5190839D9C4D26D0E604491'
              '7953AC1FBC3DC8B3B292393ED5E9E43F7DF9EE8C'
              'A21FAB74B0088AA361152586B8EF1A6BA9DA2D5C'
              'EFC0A467D613CB83C7ED6D30D894E2CE8B3D79F5'
              'BA5473A2B0587B07FB27CF2D216094DFD0CB81EF')

validpgpkeys+=('8657ABB260F056B1E5190839D9C4D26D0E604491'  # Matt Caswell <matt@openssl.org>
              '7953AC1FBC3DC8B3B292393ED5E9E43F7DF9EE8C'   # Matt Caswell <matt@openssl.org>
              'A21FAB74B0088AA361152586B8EF1A6BA9DA2D5C'   # Tomá? Mráz <tm@t8m.info>
              'EFC0A467D613CB83C7ED6D30D894E2CE8B3D79F5')  # OpenSSL security team key
# zlib
source+=("https://zlib.net/zlib-${_zlibver}.tar.gz"{,.asc})
validpgpkeys+=('5ED46A6721D365587791E2AA783FCD8E58BCAFBA') # Mark Adler <madler@alumni.caltech.edu>
# xz
source+=("git+https://github.com/tukaani-project/xz#tag=v${_xzver}")
validpgpkeys+=('3690C240CE51B4670D30AD1C38EE757D69184620')  # Lasse Collin <lasse.collin@tukaani.org>
# bzip2
source+=("https://sourceware.org/pub/bzip2/bzip2-${_bzipver}.tar.gz"{,.sig})
validpgpkeys+=('EC3CFE88F6CA0788774F5C1D1AA44BE649DE760A') # Mark Wielaard <mark@klomp.org>
# zstd
source+=("https://github.com/facebook/zstd/releases/download/v${_zstdver}/zstd-${_zstdver}.tar.zst"{,.sig})
validpgpkeys+=('4EF4AC63455FC9F4545D9B7DEF8FE99528B52FFD') # Zstandard Release Signing Key <signing@zstd.net>

export LDFLAGS="$LDFLAGS -static"
export CC=musl-gcc
export CXX=musl-gcc

# https://www.openwall.com/lists/musl/2014/11/05/3
# fstack-protector and musl do not get along but only on i686
if [[ $CARCH = i686 || $CARCH = pentium4 || $CARCH = i486 ]]; then
    # silly build systems have configure checks or buildtime programs that don't CFLAGS but do do CC
    export CC="musl-gcc -fno-stack-protector"
    export CXX="musl-gcc -fno-stack-protector"
    export CFLAGS="${CFLAGS/-fstack-protector-strong/}"
    export CXXFLAGS="${CXXFLAGS/-fstack-protector-strong/}"
fi

# to enable func64 interface in musl for 64-bit file system functions
export CFLAGS+=' -D_LARGEFILE64_SOURCE'
export CXXFLAGS+=' -D_LARGEFILE64_SOURCE'

# keep using xz-compressed packages, because one use of the package is to
# recover on systems with broken zstd support in libarchive
[[ $PKGEXT = .pkg.tar.zst ]] && PKGEXT=.pkg.tar.xz

prepare() {
    cd "${srcdir}/${_pkgname}"

    local _c _l
    for _c in "${_backports[@]}"; do
        if [[ "${_c}" == *..* ]]; then _l='--reverse'; else _l='--max-count=1'; fi
        git log --oneline "${_l}" "${_c}"
        git cherry-pick --mainline 1 --no-commit "${_c}"
    done
    for _c in "${_reverts[@]}"; do
        if [[ "${_c}" == *..* ]]; then _l='--reverse'; else _l='--max-count=1'; fi
        git log --oneline "${_l}" "${_c}"
        git revert --mainline 1 --no-commit "${_c}"
    done

    # patch for libtool building static binaries with -all-static
    # (thanks to the Gentoo people: https://bugs.gentoo.org/591096)    
    patch -Np1 < "${srcdir}/libarchive-3.8.3-all-static.patch"

    autoreconf -fiv

    # attr
    cd "${srcdir}"/attr-${_attrver}
    patch -Np1 -i "${srcdir}/attr-2.5.2-basename-libgen.patch"
	
	# remove the nfs entries from /etc/xattr.conf
	# http://lists.gnu.org/archive/html/bug-coreutils/2019-03/msg00008.html
	sed -i '/nfs/d' xattr.conf

    # openssl
    cd "${srcdir}"/openssl-${_sslver}
    patch -Np1 -i "${srcdir}/ca-dir.patch"
    case ${CARCH} in
        arm|armv6h|armv7h)
            # special patch to omit -latomic when installing pkgconfig files
            msg2 "Applying openssl patch openssl-3.0.7-no-atomic.patch..."
            patch -Np1 -i "${srcdir}/openssl-3.0.7-no-atomic.patch"
    esac
}

build() {
    export PKG_CONFIG_PATH="${srcdir}"/temp/usr/lib/pkgconfig
    export PATH="${srcdir}/temp/usr/bin:${PATH}"

    # attr
    cd "${srcdir}"/attr-${_attrver}
    ./configure --prefix="${srcdir}"/temp/usr \
                --disable-shared
    make
    make install

    # acl
    cd "${srcdir}"/acl-${_aclver}
    CPPFLAGS="-I${srcdir}/temp/usr/include" CFLAGS="-L${srcdir}/temp/usr/lib" \
    ./configure --prefix="${srcdir}"/temp/usr \
                --disable-shared
    make
    make install

    # openssl
    cd "${srcdir}"/openssl-${_sslver}
    case ${CARCH} in
        x86_64)
            openssltarget='linux-x86_64'
            optflags='enable-ec_nistp_64_gcc_128'
            ;;
        pentium4)
            openssltarget='linux-elf'
            optflags=''
            ;;
        i686)
            openssltarget='linux-elf'
            optflags='no-sse2'
            ;;
        i486)
            openssltarget='linux-elf'
            optflags='386 no-threads'
            ;;
        arm|armv6h|armv7h)
            openssltarget='linux-armv4'
            optflags=''
            ;;
        aarch64)
            openssltarget='linux-aarch64'
            optflags='no-afalgeng'
            ;;
    esac
    # mark stack as non-executable: http://bugs.archlinux.org/task/12434
    ./Configure --prefix="${srcdir}"/temp/usr \
                --openssldir=/etc/ssl \
                --libdir=lib \
                -static \
                no-ssl3-method \
                ${optflags} \
                "${openssltarget}" \
                "-Wa,--noexecstack ${CPPFLAGS} ${CFLAGS} ${LDFLAGS}"
    make build_libs
    make install_dev

    # xz
    cd "${srcdir}"/xz
    ./autogen.sh --no-po4a --no-doxygen
    ./configure --prefix="${srcdir}"/temp/usr \
                --disable-shared
    cd src/liblzma
    make
    make install

    # bzip2
    cd "${srcdir}"/bzip2-${_bzipver}
    sed -i "s|-O2|${CFLAGS}|g;s|CC=gcc|CC=${CC}|g" Makefile
    make libbz2.a
    install -Dvm644 bzlib.h "${srcdir}"/temp/usr/include/
    install -Dvm644 libbz2.a "${srcdir}"/temp/usr/lib/

    cd "${srcdir}"/zstd-${_zstdver}/lib
    make libzstd.a
    make PREFIX="${srcdir}"/temp/usr install-pc install-static install-includes

    # zlib
    cd "${srcdir}/"zlib-${_zlibver}
    ./configure --prefix="${srcdir}"/temp/usr \
                --static
    make libz.a
    make install

    # Finally build libarchive
    cd "${srcdir}/${_pkgname}"
    CFLAGS="-static -I${srcdir}/temp/usr/include" LDFLAGS="-L${srcdir}/temp/usr/lib" \
        ./configure --prefix="${srcdir}"/temp/usr \
                    --bindir=/usr/bin \
                    --without-xml2 \
                    --without-lz4 \
                    --without-nettle \
                    --without-expat \
                    --disable-shared \
                    --enable-bsdtar=static \
                    --enable-bsdcat=static \
                    --enable-bsdcpio=static \
                    --enable-bsdunzip=static    
    make V=1
    make install-{includeHEADERS,libLTLIBRARIES,pkgconfigDATA,includeHEADERS}
}

package() {
    cd "${srcdir}/${_pkgname}"
    make DESTDIR="$pkgdir" install

    for exe in "${pkgdir}"/usr/bin/*; do
        if [[ -f ${exe} && $(head -c4 "${exe}") = $'\x7fELF' ]]; then
            mv "${exe}" "${exe}"-static
        else
            rm "${exe}"
        fi
    done
    
    # remove some temporary stuff
    rm -rf "${pkgdir}"/data

    install -Dm0644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
