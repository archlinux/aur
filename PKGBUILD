# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Jonathon Fernyhough <jonathon + m2x + dev>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc
# NOTE: libtool requires rebuilt with each new gcc version

set -u
pkgname=('gcc8' 'gcc8-libs' 'gcc8-fortran')
pkgver='8.5.0'
_islver='0.24'
_pkgver='8'
_majorver="${pkgver:0:1}"
pkgrel='2'
pkgdesc='The GNU Compiler Collection (8.x.x)'
arch=('x86_64')
url='http://gcc.gnu.org'
license=('GPL' 'LGPL' 'FDL' 'custom')
makedepends=('binutils' 'libmpc' 'doxygen' 'python')
checkdepends=('dejagnu' 'inetutils')
options=('!emptydirs' '!strip' '!buildflags')
options+=('!lto')
source=(
  "https://sourceware.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.xz"{,.sig}
  "https://sourceware.org/pub/gcc/infrastructure/isl-${_islver}.tar.bz2"
  'c89'
  'c99'
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
)
for _gt in "${_gentoo[@]}"; do
  source+=("https://raw.githubusercontent.com/gentoo/gcc-patches/master/${pkgver}/gentoo/${_gt}")
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
         '7b113a1e76d277418d77ce6ea72d9f0f')
sha256sums=('d308841a511bb830a6100397b0042db24ce11f642dab6ea6ee44842e5325ed50'
            'SKIP'
            'fcf78dd9656c10eb8cf9fbd5f59a0b6b01386205fe1934b3b287a0a1898145c0'
            '1ec3372373d0e20b9f32057c0e90ad776086f5d407b388b78b9699a272bf5a3f'
            '30e17222514da5a225272aca3da79bdf3e088656a6a00a7cc6ceab91bea1e032'
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
            '2c73f411779114c5e1a971ca19e0ef950a428922ac4845e7666b0fdebe4aa1a1')
sha512sums=('92f599680e6b7fbce88bcdda810f468777d541e5fddfbb287f7977d51093de2a5178bd0e6a08dfe37090ea10a0508a43ccd00220041abbbec33f1179bfc174d8'
            'SKIP'
            'aab3bddbda96b801d0f56d2869f943157aad52a6f6e6a61745edd740234c635c38231af20bc3f1a08d416a5e973a90e18249078ed8e4ae2f1d5de57658738e95'
            'aa3fe5cd3259bc74ed464b4dcccbabe0933628e6f2997d7e9abbfb4fd558dd1f6db79dec55970b9173e49c479e0b87e9d743d8087f3912b256fa78e38e17430d'
            'b3962925604937d49527bf790d15aad2966cca86e419b7f79bff15f971931924af6a57883d8529a72630caac59be1598374793cf152056cda8278f6f6e674834'
            '91181cd5cc9892bcfafb2ee63efe58dcfcd5e35128141ca6aa3dd2add39de3bf060cf98cdfbfc94f802f4de89c55b5e39f897e1b5c445249150acc39c97f1f2c'
            'e026bf9f73ee254528423c6cabdfd7794960c567161581b7d4b7c61c45027e12a6efef79662d4288b9cbaecb4798f01af6a5b4a13b766c2d501444ac1846fd43'
            '37de4cc9061bfe1963e6e6570e1a6bbfd58204bf90e0eef819882599a9a80ea28f3eb815c20c1f173dc25d4bd9971b7c7f7f9512d6f8f91f04de1e1175114d4d'
            '38a0fedeac3eebe4a6a957792ba520225cf42663c96a171cd168fdb6c91ffa9a56b80351f8238c5d03b78d3ae2a6539a54481fe4848b4a395e2c87f2ff7adc08'
            'bfb67da0dbe8a014793ae6d3b00df7e9d48c1b9d26cf35cdbbcf6432fffec16afe89f96cfc81e4985c0c13689e2f0eec1facb880bdbe51859ae28fa4ffc07871'
            '97ae5ba86fcfd1bbeffd286b62b2f5cae5ad6519964c9ec928090868b38f459963b07581af8a9c67478c44b6989f2b30438ebaf8962cbcb45f3683ee37f04011'
            'a8806536fc5ef0d760b089a67ddc1c5a3d9ff5f8aa20be7b73e6a8393add719bce49ca68de6c1477e812e723b46a6ec3b3b24fd2cc1b8052dfef8b6a66160ae4'
            '840070a3c423e6206aaa6e63e1d9a0fcd6efd53626cd1240a193f0b60aa5d84216acc4a2a4fa8bce74549b07e6a316b01d638f20cea13dc62473491a302fb3d6'
            '0a0bc72b9366158f5d23fff1928e756fdd212433bac6ab1f00d632f241382820db8db5d475ddf11ea020eaf7e2e71b12fb9b1c3c870cf84adf6c2b16f15aabca'
            'f8f38fb2290bb7eb678f67cbcb7bdc83cf7dc2d578020b6f6b58d1f503c2985d256edb7d484b9bbdfd92f4bde48ae2a145b74f723dba911a5df089f462263a67'
            '1e982e2863c25b9789cf517f3b87768ad3cd805d83ed5d8df50b802d99fc1e12bed9be47472f42b4fff99e3668dcf2db6d1d4f225aa00bbc5ac189686326450a'
            '4a328d1e1a56c20166307edcfa322068915784d9c08025b7f81cf69714da48fc266b6d34f77b9135c2f10da830d9df408276a1b78d1fd218637c2823506593c2'
            '801c0032287a85a8310cda1442d3de829620b01f52bba98bd6df726bd36215f5816dc0700345393f126eb0e63348e9cf3cd18099c029f9c44d38d62d703b6628'
            'f07282793735d8f04f3f870d381deb1d5bc8d38d42c495c8324cc82c3327c00fc96bf3b69deeffa122ad81d7d0d44d35147ddf8c4a5056a43d58bca0a8b5b68b'
            '0e09efa733518961398c0d87ad8a4a7cc18e979080bc97c5f13c62e5adc0adc172e7f7391071d80226d4d9097f62e972ac9405677b6e568147a2fd244244e8e6'
            '119042259a4965b13463f6e379c9a5c6f0b4ce5bd1412d11f53541205c30bbb77e65f6670ac14271a02b90c6e9737efc3b52b92ca1d0f485414ae836184119a7'
            '4bfa6f18afc23f3c4e6b0690f38576780ff68c4857870660d93d4ba2787ee00e8befc68e72a16a29adf25d52f1835c7be7286f1300d5d97b7d43848ed25ce577'
            'e4dfbf16e27b91a1673fb27ecd86d26e164f19656e75ad62f24a36ef8be64105da9075cc71d96b0dff8ab8f5dc097d7d97197071cb3a535dd4d50bdc9e4a374d'
            '4d42047c159df3fd9397c3a81b9a182c55aad9345d3328a50af7b3d4b8b67b6538fbab1edc709e3a5e754fdaa9802a12a1b8b3de002819c25f1f1babd88ab80e'
            '9b626ce710476d5b361ab4b2bb06ad195ab043c76bcdf52197c74379ee2698d24d5a158ed6b42a84727c2e4937e7e6d3db52d7e45885d19103fcd68ef3d9b4a2'
            '4246b1bb570a5976d2a4ef843035fe706f13f8f5838515513265a2d12bd6c80fe09d2f93327e333bcd816dc225c9638ba919e0e0cd81c02ef96813b261d968a2'
            '78ba5c194896c6086a54af725ca4e6dd1e0f5694577bd3543db611481e0c760e7b1bf0b0e786128ec70a823f29efffcc0d61da34e7d58903260ada851cb4d9f4'
            '6db619410cbc46f77150b40dd839a2417fb62d7f8afd66c44c453ff4b3e25248e18df26c08f4ebfeef39526b9d0dc297b9084bd312600e252bfd63afa9b32a0b'
            'f357615d133b264a19e13949dd05a9c06f6a8443c003471d9c0bd4b8b28f23f3eaff3534331e44a487e98e59e10e2437623fdad3d07810dccf99f257d39fb202'
            'fc4bade1271acec771b7ce1e7e4ad02a06e2a41525e867200b7ad9757184bf7e52831b1adfe7c3adaebc4748363f5b997b62b49ecb90104ae2d30a15368ed829'
            '757980fb37eaddd33e46d346019d053e151ac894095b5d20974810873cfbb8d42a557d69b425891066279a3374209e8eb9d227095b76e056c50e6cfa0ae22b42'
            'a6bba7c6f1bc83030cb29fa783ffd51ad2d361319c23690870617695cb3cd5ae7dda435afe92ed5116ea4a9cba9b96de09acfecea7acb30d0ac68c8aaf2b1a1e'
            '0b15772e4b0aaa2ca5062fe9b5ca46a09bd9851663b1bbc75509c046785aeba36c799c7f8beef702532e1a7b906f09a4f8adc63baa090556c31e153f004c1d77'
            '9ef27df960a82695d7fbc0c732c91620fe0897aefb5ef89eac578a2cde9779b6f4ee6504b7f3e6e1fc26bc41edf938cd680e7c5efde5c314831f7da50ac25e74'
            '0ef43b2a2bb545679854aa1dafdc48e23330722a0ab3e918d2eace376a2f67cd7751b9892ad30ca5d3155c81bad6cb4526acc167ab91b458893ceb80ad85b27e'
            '2b670c704e2aeb8470cc75a56830cc9e4a7a4f13936315b18a06541d938d0c992821b960639c3e44208357f2cbd3bc0915ea156abef9e8c3700f6da804f89ea1'
            '67b16d9f75f12063ce4aa3dab1ebb99b9e260401e9515011eab0d11f0074ac9e57556ed5cfb0743a8bbe14684847e18a381d5dab2a2e1abed67d9d9b36ed2763')

if [ -n "${_snapshot:-}" ]; then
  _basedir="gcc-${_snapshot}"
else
  _basedir="gcc-${pkgver}"
fi

_libdir="usr/lib/gcc/${CHOST}/${pkgver%%+*}"

prepare() {
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
  sed -e '/ac_cpp=/s/$CPPFLAGS/$CPPFLAGS -O2/' -i {libiberty,gcc}/configure

  # Apply patches
  local _src
  for _src in "${source[@]}"; do
    _src="${_src%%::*}"
    _src="${_src##*/}"
    case "${_src}" in
    *.patch)
      set +u; msg2 "*** Applying patch ${_src}..."; set -u
      patch --no-backup-if-mismatch -Np1 -i "${srcdir}/${_src}"
      ;;
    esac
  done

  rm -rf 'gcc-build'
  mkdir 'gcc-build'

  set +u
}

build() {
  set -u
  cd "${_basedir}/gcc-build"

  # using -pipe causes spurious test-suite failures
  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=48565
  #CFLAGS="${CFLAGS/-pipe/}"
  #CXXFLAGS="${CXXFLAGS/-pipe/}"

  # Force this for now, doesn't seem to be picked up via patch from https://bugs.archlinux.org/task/70701
  CFLAGS+=' -Wno-format -Wno-format-security'
  CXXFLAGS+=' -Wno-format -Wno-format-security'

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
      --enable-cet=auto
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
      --program-suffix="-${_pkgver}"
      --with-bugurl='https://bugs.archlinux.org/'
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
  nice make -s

  set +u; msg 'Compile complete'; set -u

  # make documentation
  make -s -j1 -C "${CHOST}/libstdc++-v3/doc" 'doc-man-doxygen'
  set +u
}

check() {
  set -u
  cd "${_basedir}/gcc-build"

  # do not abort on error as some are "expected"
  LD_PRELOAD='/usr/lib/libstdc++.so' \
  make -k check || true
  ../contrib/test_summary
  set +u
}

package_gcc8-libs() {
  set -u
  pkgdesc='Runtime libraries shipped by GCC (8.x.x)'
  depends=('glibc>=2.27')
  options+=('!strip')

  cd "${_basedir}/gcc-build"
  make -j1 -s -C "${CHOST}/libgcc" DESTDIR="${pkgdir}" install-shared
  mv "${pkgdir}/${_libdir}/../lib"/* "${pkgdir}/${_libdir}"
  rmdir "${pkgdir}/${_libdir}/../lib"
  rm -f "${pkgdir}/${_libdir}/libgcc_eh.a"

  local _lib
  for _lib in libatomic \
             libgfortran \
             libgomp \
             libitm \
             libquadmath \
             libsanitizer/{a,l,ub,t}san \
             libstdc++-v3/src \
             libvtv; do
    make -j1 -s -C "${CHOST}/${_lib}" DESTDIR="${pkgdir}" 'install-toolexeclibLTLIBRARIES'
  done

  make -j1 -s -C "${CHOST}/libmpx" DESTDIR="${pkgdir}" install
  rm -f "${pkgdir}/${_libdir}/libmpx.spec"

  # Install Runtime Library Exception
  install -Dm644 '../COPYING.RUNTIME' \
    "${pkgdir}/usr/share/licenses/gcc8-libs/RUNTIME.LIBRARY.EXCEPTION"
  set +u
}

package_gcc8() {
  set -u
  pkgdesc='The GNU Compiler Collection - C and C++ frontends (8.x.x)'
  depends=("gcc8-libs=${pkgver}-${pkgrel}" 'binutils>=2.28' 'libmpc')
  options+=('staticlibs')

  cd "${_basedir}/gcc-build"

  make -j1 -s -C 'gcc' DESTDIR="${pkgdir}" install-driver install-cpp install-gcc-ar \
    c++.install-common install-headers install-plugin install-lto-wrapper

  install -m755 -t "${pkgdir}/${_libdir}/" gcc/{cc1,cc1plus,collect2,lto1,gcov,gcov-tool}

  make -j1 -s -C "${CHOST}/libgcc" DESTDIR="${pkgdir}" install
  rm -r "${pkgdir}/${_libdir}/../lib"

  make -j1 -s -C "${CHOST}/libstdc++-v3/src" DESTDIR="${pkgdir}" install
  make -j1 -s -C "${CHOST}/libstdc++-v3/include" DESTDIR="${pkgdir}" install
  make -j1 -s -C "${CHOST}/libstdc++-v3/libsupc++" DESTDIR="${pkgdir}" install
  make -j1 -s -C "${CHOST}/libstdc++-v3/python" DESTDIR="${pkgdir}" install
  rm "${pkgdir}/${_libdir}"/libstdc++.so*

  make -j1 -s DESTDIR="${pkgdir}" install-fixincludes
  make -j1 -s -C 'gcc' DESTDIR="${pkgdir}" install-mkheaders

  make -j1 -s -C 'lto-plugin' DESTDIR="${pkgdir}" install

  make -j1 -s -C "${CHOST}/libgomp" DESTDIR="${pkgdir}" install-nodist_{libsubinclude,toolexeclib}HEADERS
  make -j1 -s -C "${CHOST}/libitm" DESTDIR="${pkgdir}" install-nodist_toolexeclibHEADERS
  make -j1 -s -C "${CHOST}/libquadmath" DESTDIR="${pkgdir}" install-nodist_libsubincludeHEADERS
  make -j1 -s -C "${CHOST}/libsanitizer" DESTDIR="${pkgdir}" install-nodist_{saninclude,toolexeclib}HEADERS
  make -j1 -s -C "${CHOST}/libsanitizer/asan" DESTDIR="${pkgdir}" install-nodist_toolexeclibHEADERS
  make -j1 -s -C "${CHOST}/libsanitizer/tsan" DESTDIR="${pkgdir}" install-nodist_toolexeclibHEADERS
  make -j1 -s -C "${CHOST}/libsanitizer/lsan" DESTDIR="${pkgdir}" install-nodist_toolexeclibHEADERS
  make -j1 -s -C "${CHOST}/libmpx" DESTDIR="${pkgdir}" install-nodist_toolexeclibHEADERS

  make -j1 -s -C 'libcpp' DESTDIR="${pkgdir}" install

  # many packages expect this symlink
  ln -s "gcc-${_majorver}" "${pkgdir}/usr/bin/cc-${_majorver}"

  # POSIX conformance launcher scripts for c89 and c99
  install -Dm755 "${srcdir}/c89" "${pkgdir}/usr/bin/c89-${_majorver}"
  install -Dm755 "${srcdir}/c99" "${pkgdir}/usr/bin/c99-${_majorver}"

  # byte-compile python libraries
  python -m compileall "${pkgdir}/usr/share/gcc-${pkgver%%+*}/"
  python -O -m compileall "${pkgdir}/usr/share/gcc-${pkgver%%+*}/"

  # Install Runtime Library Exception
  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  ln -s '/usr/share/licenses/gcc8-libs/RUNTIME.LIBRARY.EXCEPTION' \
    "${pkgdir}/usr/share/licenses/${pkgname}/"

  # Remove conflicting files
  rm -rf "${pkgdir}/usr/share/locale"
  set +u
}

package_gcc8-fortran() {
  set -u
  pkgdesc='Fortran front-end for GCC (8.x.x)'
  depends=("gcc8=${pkgver}-${pkgrel}")

  cd "${_basedir}/gcc-build"
  make -j1 -s -C "${CHOST}/libgfortran" DESTDIR="${pkgdir}" install-cafexeclibLTLIBRARIES \
    install-{toolexeclibDATA,nodist_fincludeHEADERS}
  make -j1 -s -C "${CHOST}/libgomp" DESTDIR="${pkgdir}" install-nodist_fincludeHEADERS
  make -j1 -s -C 'gcc' DESTDIR="${pkgdir}" fortran.install-common
  install -Dm755 'gcc/f951' "${pkgdir}/${_libdir}/f951"

  ln -s "gfortran-${_majorver}" "${pkgdir}/usr/bin/f95-${_majorver}"

  # Install Runtime Library Exception
  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  ln -s '/usr/share/licenses/gcc-libs/RUNTIME.LIBRARY.EXCEPTION' \
    "${pkgdir}/usr/share/licenses/${pkgname}/"
  set +u
}
set +u
