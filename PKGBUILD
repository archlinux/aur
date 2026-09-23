# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Jonathon Fernyhough <jonathon + m2x + dev>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc
# NOTE: libtool requires rebuilt with each new gcc version

set -u
pkgbase='gcc8'
pkgname=("${pkgbase}" "${pkgbase}-libs" "${pkgbase}-fortran")
pkgver='8.5.0'
_majorver="${pkgver: 0:1}"
_islver='0.24'
pkgrel='2'
pkgdesc="The GNU Compiler Collection (${_majorver}.x.x)"
arch=('x86_64')
url='https://gcc.gnu.org'
license=('GPL-2.0-only' 'LGPL-2.1-only' 'GPL-3.0-only' 'LGPL-3.0-only' 'GFDL-1.3-only' 'custom')
depends=('glibc' 'gcc-libs' 'binutils' 'python' 'zlib')
makedepends=('libmpc' 'doxygen')
checkdepends=('dejagnu' 'inetutils')
options=('!emptydirs' '!strip' '!buildflags')
options+=('!lto')
source=(
  "https://sourceware.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.xz"{,.sig}
  "https://sourceware.org/pub/gcc/infrastructure/isl-${_islver}.tar.bz2"
  'c89'
  'c99'
  '78_all-libsanitizer-Fix-build-with-glibc-2.42.patch'
  '79_all-sanitizer_common-Remove-reference-to-obsolete-termio.patch'
  '0000-kernel-7.1-remove-linux-scc.patch'
)
_gentoo=(
  '01_all_default-fortify-source.patch'
  '02_all_default-warn-format-security.patch'
  '03_all_default-warn-trampolines.patch'
  '04_all_default-ssp-fix.patch'
  '05_all_alpha-mieee-default.patch'
  '06_all_ia64_note.GNU-stack.patch'
  '07_all_i386_libgcc_note.GNU-stack.patch'
  '08_all_libiberty-asprintf.patch'
  '09_all_libiberty-pic.patch'
  '10_all_nopie-all-flags.patch'
  '11_all_extra-options.patch'
  '12_all_pr55930-dependency-tracking.patch'
  '13_all_sh-drop-sysroot-suffix.patch'
  '14_all_ia64-TEXTREL.patch'
  '15_all_disable-systemtap-switch.patch'
  '16_all_m68k-textrel-on-libgcc.patch'
  '17_all_respect-build-cxxflags.patch'
  '18_all_libgfortran-Werror.patch'
  '19_all_libgomp-Werror.patch'
  '20_all_libitm-Werror.patch'
  '21_all_libatomic-Werror.patch'
  '22_all_libbacktrace-Werror.patch'
  '23_all_libsanitizer-Werror.patch'
  '24_all_libstdcxx-no-vtv.patch'
  '25_all_overridable_native.patch'
  '27_all_disable-riscv32-ABIs.patch'
  '28_all_libcpp-ar.patch'
  '29_all_plugin-objdump.patch'
  '30_all_remove-cyclades.patch'
  '31_all_powerpcspe-pie-crt.patch'
  '32_all_powerpcspe-march-PLATFORM.patch'
  '33_all_msgfmt-libstdc++-link.patch'
  '34_all_Fix-build-breakage-with-latest-glibc-release.patch'
  '35_all_re-PR-ada-81103-gcc-ada-terminals.c-please-remove-un.patch'
  '36_all_glibc_236.patch'
  # https://github.com/gentoo/gcc-patches/tree/master/8.5.0/gentoo
)
for _gt in "${_gentoo[@]}"; do
  source+=("https://raw.githubusercontent.com/gentoo/gcc-patches/refs/heads/master/${pkgver}/gentoo/${_gt}")
done
unset _gt _gentoo
validpgpkeys=(
  '13975A70E63C361C73AE69EF6EEB81F8981C74C7'  # richard.guenther@gmail.com
  'D3A93CAD751C2AF4F8C7AD516C35B99309B5FA62'  # Jakub Jelinek <jakub@redhat.com>
)
md5sums=('0c1f625768840187ef3b10adebe8e3b0'
         'SKIP'
         'dd2f7b78e118c25bd96134a52aae7f4d'
         'aab23fb7d3568065e8d16f1cc9502bde'
         'a62bdf6ed6b985e899275f4bdabbb2a0'
         '5c20615dc4e591bf717132f27431a6ae'
         'b17da62ec2d4808305088f73f4d20f35'
         '63cea3f3613b837d327a1ddfcda38e1c'
         '391cd72d845798db8da4886dff4f7b2a'
         '985662123a68a9b441d3e96e08da91aa'
         'd761d480744208495367f3a4cef98374'
         '81099ae8955a012f5c376c622f7ff5c6'
         '94c07708f381a8c7521b1e27668c72e6'
         'af9412b43664373a7a8aef4ffa43e720'
         '2042000017ed16abf47e44019df3cfd8'
         'a99126f384a2899ff2716ad7389b784b'
         'd8692c56f04b92667096f59d843e95c5'
         '258338a846747db651183233309d8716'
         'f810ed86826ed5802d5b91b2a7d3c492'
         '7d4c5c1becd11ab4fe0ef9088f96e638'
         'b289e0d16090a1f480f1b3074cdb261a'
         'd373f9809c98dd7433fc866841c58194'
         '3b9ad9b763eac3c7779f9d7cd824b799'
         '3e3efdf41509c192dc28ef642c71fa29'
         '565f9ddab225fb8ba81742edc77bda55'
         '5a1228ac881f169e6866814789ed4b1a'
         '59cb8e734e4b98c489c36823c086bc8a'
         'df2cd1feddcb8f0a03af554e75069306'
         '6a97e776ab86515d76d90d21a80c0e3c'
         '058587055f311ece31bced50ce11632f'
         'a152ddc4bb91f916521914e8b8e3e67a'
         '39c0975992b4fc4fc2913fb355170568'
         '66855df1e2694eff7f76b127dda1206b'
         '312d2c48ad1c36eedc793a719ea9ce8d'
         '6b6955fb4be27d23d453e731a810046f'
         '9e9767733f8f3a41b6910a8dbbbd5cba'
         '0a011943098270848d05b3dfecfd79d5'
         'd2aa2fc83388a470a022286eca2736a6'
         '8e3b85e25d2f05423391b97811849e62'
         '7b113a1e76d277418d77ce6ea72d9f0f'
         '59ed3f49a1274229f1d6631545f53316'
         '29d3b777ebad590b2dbe7aeb04c4ddbc'
         '9b4934809323ec474a95816a52e777e5')
sha256sums=('d308841a511bb830a6100397b0042db24ce11f642dab6ea6ee44842e5325ed50'
            'SKIP'
            'fcf78dd9656c10eb8cf9fbd5f59a0b6b01386205fe1934b3b287a0a1898145c0'
            '1ec3372373d0e20b9f32057c0e90ad776086f5d407b388b78b9699a272bf5a3f'
            '30e17222514da5a225272aca3da79bdf3e088656a6a00a7cc6ceab91bea1e032'
            'a20c392af8b730bde85f1e058d1fc97ebf40a1a08ea8ca44fcfbfea3c374861e'
            '02b4965b25af0e1dcb8670bbcc779edc6fd6f36c238b45a8c6a77ac801dc2d89'
            '7c3bdc5f194ce01a1fd8766e8be2e2ab550a3d2e1ed4ab067525f73971b3c66a'
            '84873199a960f17b0dd2aba8a4c699067640d04b23fb5b320e59ca97aab2ec68'
            '964563c4266c7674054debe4f75a045bfa7a793477acdc2deeb04ee832892e85'
            '60e8e26d4ee8a6c732b027c09f7a0e9f3a8e5f88b3201947b6fbbbedb62d560c'
            'f45160f699501568ae9e81127562395dd95b5b4a8e4d55a1615fbb00f9e4deb2'
            '1746a311a9e66e162ba9cf2d31959dedc9e1926eab400141c2eb1bb82beb0fbc'
            '2f6014b220299991832cbd7ca83a717fc3ae41b5b529b62cb65c7c485f77e352'
            'acfe21fd46de7415d041b3ab6342b57c7ad535c893248404b30c6ea411c8eb84'
            '7e19261e2b5a5b9e518f6fd6844c1f0f5d0306de8bc1537c7c5cc4992a391049'
            'da6bbb5dc654d5e1df8ecae5c9ebb56265426c405931f14f5878248b8c79f78d'
            'ee6aaecbef97689194bc81ba369ffc983cd3512540a52cf445f4f9980bbba83f'
            '47833859575f19101b094ce5162ae650a5bd68aefd66c9d74ac4ab8571b48ba2'
            'f108fdc8bb62aea4245ff9ad3d314603c69f7993f4c81de3a4c92a44b80b206e'
            'da01e945c04a579cd0f353d45e17e6b5903a9de16a84273c66345f80e098255d'
            'fd3d4ac1cbe62abe63d39c5fcfb9ad23ab082f1f0d77981f2cc9b758dab954e4'
            'de33cdcd9c446616957a37fc71203ff12d67e2d9eb1db5b2071424069cda27c7'
            '61eb2ea1ca465f57bb22fc7e4da414cba473af03802f67811b303b0cb8513a2f'
            '44692d8dc8a5b924b494af3ce097d11573b9f6f03f95461b2bb73a77664bc5fe'
            '7169d8b887429c4a4970f1af1d70a2a816c9be9ac3649f912d21de5a0ae47477'
            '9fc47618d10e8b55269381c208078397d132dd8971e64bd6cc01f993ccc18409'
            '279768f369b803003ced9909354f1b21ac4d4b56afb2180cbeaeebeeadf65fb7'
            'cef0a5596cf6ce23e02bbc713c2fe5be1dc4c47b4a7fc0e943bc57ae6f6127cd'
            '6093a99c2dff5b4eb1e37642052cad3d52bd87e248d677463b99567582c5639a'
            '5104f0e29ea842e0357c123d0c7c14b86748a81328306ba0582d5c824fafdcbc'
            'b16d4724ff63f3749474e8c1aeed186940f23b2587e8ce7e907b906e7341faba'
            '0c71a04fef67248b356d2e154b45a5a1966d4a5b669c840d8dddbafb704c3351'
            '9c819827103c7c7386ad602863517b1e75480972f4165982a81996bd08a59235'
            'ee1ac648a5fd81871c80bf7b11d08fb51148c9f01c51d3ceb98b8aa5ddd01442'
            '7cf90f1ec3e4f6c574d822b03219de15619d78f07ac8e5426994efacc07b130f'
            '983ec8dd701287d9e391332dee7ad888cc421a3d3a28c22438689e3cacd34a65'
            '611f39b256ed4897ef5c8a6ed5418c00cd3f3a65db020ee8f65a15eecff07691'
            'd166e7d8889a73a81df1d307b4fe169bb28be30d2ad8fd3feac4b2ebba31e9de'
            '2c73f411779114c5e1a971ca19e0ef950a428922ac4845e7666b0fdebe4aa1a1'
            '3b01e5f63747fa3682431dac998ab23cd697dbab03956cc982763de4074e3a9d'
            '5f717302056b8610a6812844b7a1475bfba8ddf9d4b695745605f81c5525d52a'
            '35ae955b7a6b0a542947085a2049eebf760062b3f8d30a7f956011ce3c42daf5')

if [ -n "${_snapshot:-}" ]; then
  _basedir="gcc-${_snapshot}"
else
  _basedir="gcc-${pkgver}"
fi

_fn_setlibdir() {
  _libdir="usr/lib/gcc/${CHOST}/${pkgver%%+*}"
}

prepare() {
  local -
  set -u
  cd "${_basedir}"

  # link isl for in-tree build
  ln -s "../isl-${_islver}" 'isl'

  # Do not run fixincludes
  sed -e 's@\./fixinc\.sh@-c true@' -i 'gcc/Makefile.in'

  # Arch Linux installs x86_64 libraries /lib
  case "${CARCH}" in
  'x86_64') sed -e '/m64=/ s/lib64/lib/' -i 'gcc/config/i386/t-linux64' ;;
  esac

  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  sed -e '/ac_cpp=/ s/$CPPFLAGS/$CPPFLAGS -O2/' -i {libiberty,gcc}/configure

  # Apply patches
  local _pt
  for _pt in "${source[@]%%::*}"; do
    _pt="${_pt##*/}"
    case "${_pt}" in
    *.patch)
      set +u; msg2 "*** Applying patch ${_pt}"; set -u
      patch --no-backup-if-mismatch -Np1 -i "${srcdir}/${_pt}"
      ;;
    esac
  done
  #cd ..; cp -pr "${_basedir}" 'a'; ln -s "${_basedir}" 'b'; false
  #diff -pNaru5 'a' 'b' > 0000-$RANDOM.patch

  rm -rf 'gcc-build'
  mkdir 'gcc-build'
}

build() {
  local -
  set -u
  cd "${_basedir}/gcc-build"

  # using -pipe causes spurious test-suite failures
  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=48565
  #CFLAGS="${CFLAGS/-pipe/}"
  #CXXFLAGS="${CXXFLAGS/-pipe/}"

  # Force this for now, doesn't seem to be picked up via patch from https://bugs.archlinux.org/task/70701
  #CFLAGS+=' -Wno-format -Wno-format-security'
  #CXXFLAGS+=' -Wno-format -Wno-format-security'

  if [ ! -s 'Makefile' ]; then
    # The following options are one per line, mostly sorted so they are easy to diff compare to other gcc packages.
    local _conf=(
      --build="${CHOST}"
      --disable-libssp
      --disable-libstdcxx-pch
      --disable-libunwind-exceptions
      --disable-multilib
      --disable-werror
      --enable-__cxa_atexit
      --enable-cet='auto'
      --enable-checking='release'
      --enable-clocale='gnu'
      --enable-default-pie
      --enable-default-ssp
      --enable-gnu-indirect-function
      --enable-gnu-unique-object
      --enable-install-libiberty
      --enable-languages='c,c++,fortran,lto'
      --enable-libmpx
      --enable-linker-build-id
      --enable-lto
      --enable-plugin
      --enable-shared
      --enable-threads='posix'
      --enable-version-specific-runtime-libs
      --infodir='/usr/share/info'
      --libdir='/usr/lib'
      --libexecdir='/usr/lib'
      --mandir='/usr/share/man'
      --program-suffix="-${_majorver}"
      --with-bugurl="https://aur.archlinux.org/packages/${pkgname}/"
      --with-isl
      --with-linker-hash-style='gnu'
      --with-system-zlib
      --prefix='/usr'
    )
    ../configure "${_conf[@]}"

    #sed -e 's/^STAGE1_CXXFLAGS.*$/& -std=gnu++11/' -i 'Makefile'
  fi

  # The system stdc must be used when gcc links to some system libraries.
  LD_PRELOAD='/usr/lib/libstdc++.so' \
  nice -n1 make -s

  set +u; msg 'Compile complete'; set -u

  # make documentation
  make -s -j1 -C "${CHOST}/libstdc++-v3/doc" 'doc-man-doxygen'
}

check_disabled() {
  local -
  set -u
  cd "${_basedir}/gcc-build"

  # do not abort on error as some are "expected"
  LD_PRELOAD='/usr/lib/libstdc++.so' \
  make -k check || true
  ../contrib/test_summary
}

package_gcc8-libs() {
  local -
  set -u
  pkgdesc="Runtime libraries shipped by GCC (${_majorver}.x.x)"
  depends=('glibc>=2.27')
  options+=('!strip')

  cd "${_basedir}/gcc-build"
  make -j1 -s -C "${CHOST}/libgcc" DESTDIR="${pkgdir}" 'install-shared'
  local _libdir; _fn_setlibdir
  mv "${pkgdir}/${_libdir}/../lib"/* "${pkgdir}/${_libdir}"
  rmdir "${pkgdir}/${_libdir}/../lib"
  rm -f "${pkgdir}/${_libdir}/libgcc_eh.a"

  local _lib _libs=(
    libatomic
    libgfortran
    libgomp
    libitm
    libquadmath
    libsanitizer/{a,l,ub,t}san
    libstdc++-v3/src
    libvtv
  )
  for _lib in "${_libs[@]}"; do
    make -j1 -s -C "${CHOST}/${_lib}" DESTDIR="${pkgdir}" 'install-toolexeclibLTLIBRARIES'
  done

  make -j1 -s -C "${CHOST}/libmpx" DESTDIR="${pkgdir}" install
  rm -f "${pkgdir}/${_libdir}/libmpx.spec"

  # Install Runtime Library Exception
  install -Dpm644 '../COPYING.RUNTIME' \
    "${pkgdir}/usr/share/licenses/${pkgbase}-libs/RUNTIME.LIBRARY.EXCEPTION"
}

package_gcc8() {
  local -
  set -u
  pkgdesc="The GNU Compiler Collection - C and C++ frontends (${_majorver}.x.x)"
  depends=("${pkgbase}-libs=${pkgver}-${pkgrel}" 'binutils>=2.28' 'libmpc')
  options+=('staticlibs')

  cd "${_basedir}/gcc-build"

  make -j1 -s -C 'gcc' DESTDIR="${pkgdir}" 'install-driver' 'install-cpp' 'install-gcc-ar' \
    'c++.install-common' 'install-headers' 'install-plugin' 'install-lto-wrapper'

  local _libdir; _fn_setlibdir
  install -m755 -t "${pkgdir}/${_libdir}/" gcc/{cc1,cc1plus,collect2,lto1,gcov,gcov-tool}

  make -j1 -s -C "${CHOST}/libgcc" DESTDIR="${pkgdir}" install
  rm -r "${pkgdir}/${_libdir}/../lib"

  make -j1 -s -C "${CHOST}/libstdc++-v3/src" DESTDIR="${pkgdir}" install
  make -j1 -s -C "${CHOST}/libstdc++-v3/include" DESTDIR="${pkgdir}" install
  make -j1 -s -C "${CHOST}/libstdc++-v3/libsupc++" DESTDIR="${pkgdir}" install
  make -j1 -s -C "${CHOST}/libstdc++-v3/python" DESTDIR="${pkgdir}" install
  rm -f "${pkgdir}/${_libdir}/"libstdc++.so*

  make -j1 -s DESTDIR="${pkgdir}" 'install-fixincludes'
  make -j1 -s -C 'gcc' DESTDIR="${pkgdir}" 'install-mkheaders'
  make -j1 -s -C 'lto-plugin' DESTDIR="${pkgdir}" install

  make -j1 -s -C "${CHOST}/libgomp" DESTDIR="${pkgdir}" install-nodist_{libsubinclude,toolexeclib}HEADERS
  make -j1 -s -C "${CHOST}/libitm" DESTDIR="${pkgdir}" 'install-nodist_toolexeclibHEADERS'
  make -j1 -s -C "${CHOST}/libquadmath" DESTDIR="${pkgdir}" 'install-nodist_libsubincludeHEADERS'
  make -j1 -s -C "${CHOST}/libsanitizer" DESTDIR="${pkgdir}" install-nodist_{saninclude,toolexeclib}HEADERS
  make -j1 -s -C "${CHOST}/libsanitizer/asan" DESTDIR="${pkgdir}" 'install-nodist_toolexeclibHEADERS'
  make -j1 -s -C "${CHOST}/libsanitizer/tsan" DESTDIR="${pkgdir}" 'install-nodist_toolexeclibHEADERS'
  make -j1 -s -C "${CHOST}/libsanitizer/lsan" DESTDIR="${pkgdir}" 'install-nodist_toolexeclibHEADERS'
  make -j1 -s -C "${CHOST}/libmpx" DESTDIR="${pkgdir}" 'install-nodist_toolexeclibHEADERS'

  make -j1 -s -C 'libcpp' DESTDIR="${pkgdir}" install

  # many packages expect this symlink
  ln -s "gcc-${_majorver}" "${pkgdir}/usr/bin/cc-${_majorver}"

  # POSIX conformance launcher scripts for c89 and c99
  install -Dm755 "${srcdir}/c89" "${pkgdir}/usr/bin/c89-${_majorver}"
  install -Dm755 "${srcdir}/c99" "${pkgdir}/usr/bin/c99-${_majorver}"

  # byte-compile python libraries
  python -m 'compileall' "${pkgdir}/usr/share/gcc-${pkgver%%+*}/"
  python -O -m 'compileall' "${pkgdir}/usr/share/gcc-${pkgver%%+*}/"

  # Install Runtime Library Exception
  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  ln -s "/usr/share/licenses/${pkgbase}-libs/RUNTIME.LIBRARY.EXCEPTION" \
    "${pkgdir}/usr/share/licenses/${pkgname}/"

  # Remove conflicting files
  rm -rf "${pkgdir}/usr/share/locale"
}

package_gcc8-fortran() {
  local -
  set -u
  pkgdesc="Fortran front-end for GCC (${_majorver}.x.x)"
  depends=("${pkgbase}=${pkgver}-${pkgrel}")

  cd "${_basedir}/gcc-build"
  make -j1 -s -C "${CHOST}/libgfortran" DESTDIR="${pkgdir}" 'install-cafexeclibLTLIBRARIES' \
    install-{toolexeclibDATA,nodist_fincludeHEADERS}
  make -j1 -s -C "${CHOST}/libgomp" DESTDIR="${pkgdir}" 'install-nodist_fincludeHEADERS'
  make -j1 -s -C 'gcc' DESTDIR="${pkgdir}" 'fortran.install-common'
  local _libdir; _fn_setlibdir
  install -Dm755 'gcc/f951' "${pkgdir}/${_libdir}/f951"

  ln -s "gfortran-${_majorver}" "${pkgdir}/usr/bin/f95-${_majorver}"

  # Install Runtime Library Exception
  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  ln -s "/usr/share/licenses/${pkgbase}-libs/RUNTIME.LIBRARY.EXCEPTION" \
    "${pkgdir}/usr/share/licenses/${pkgname}/"
}
set +u
