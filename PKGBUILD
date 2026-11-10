# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgbase=sourcemod
pkgname=(sourcemod-scripting sourcemod sourcemod-src)
# SourceMod's version: the stable branch's tag, <version>.<build>, the build being the number of
# commits, which SourceMod's versioning counts with git
pkgver=1.12.0.7260
pkgrel=5
pkgdesc="SourceMod, the scripting and administration platform for Source engine game servers"
arch=(x86_64 aarch64)
url="https://www.sourcemod.net"
license=(GPL-3.0-only LicenseRef-SourceMod-exception)
makedepends=(ambuild clang git python zlib)
# The games' addons: the SDKs (hl2sdk), Metamod:Source's sources, the 32-bit libraries of multilib
# for the 32-bit servers, the database clients, PCRE2, curl, SQLite, zlib and libmaxminddb for both
makedepends_x86_64=(
  curl
  hl2sdk
  lib32-curl
  lib32-glibc
  lib32-gcc-libs
  lib32-libmaxminddb
  lib32-mariadb-connector-c
  lib32-pcre2
  lib32-postgresql-libs
  lib32-sqlite
  lib32-zlib
  libmaxminddb
  mariadb-libs
  metamod-source-src
  pcre2
  postgresql-libs
  sqlite
)
_tag="$pkgver"
# The Zydis release SafetyHook's amalgamated copy (4.0.0) is generated from again: the 4.1 decoder
# fixes, the API SafetyHook uses is the same (upstream SafetyHook uses 4.1 unchanged)
_zydisver=4.1.1
# The full history of SourceMod, its versioning counts the commits. The submodules at the commits
# the tag pins.
source=("git+https://github.com/alliedmodders/sourcemod.git#tag=$_tag"
  "git+https://github.com/alliedmodders/amtl.git"
  "git+https://github.com/alliedmodders/sourcepawn.git"
  "git+https://github.com/alliedmodders/hl2sdk-manifests.git"
  "git+https://github.com/alliedmodders/safetyhook.git"
  "git+https://github.com/zyantific/zydis.git#tag=v$_zydisver"
  "git+https://github.com/zyantific/zycore-c.git"
  scripting-only.patch
  mysql-mariadb.patch
  pgsql-libpq.patch
  regex-pcre2.patch
  webternet-curl.patch
  sqlite-system.patch
  sourcepawn-zlib.patch
  sourcepawn-source-date-epoch.patch
  sourcepawn-shell-jit-define.patch
  sourcepawn-jit-unaligned.patch
  sourcepawn-compiler-overflow.patch
  sourcemod-delete-noexcept.patch
  sourcemod-unaligned-access.patch
  safetyhook-zydis-header.patch
  safetyhook-thunk-unaligned.patch
  amtl-hash-unsigned.patch
  sourcemod-gamebin-executable-path.patch
  geoip-libmaxminddb.patch
  zydis-amalgamate-paths.patch
  source-sdk.txt
  spcomp.sh)
sha512sums=('783fe9bb0dd53f3f751871e89a03e52911afc4fbfaddd73c03c16291a9bdd6e9fe4194caf94617c7cb94caef6850d0cd077bc6bf478846c2383607a966fbba4e'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  '7ca4fc08ad5074f7ae7115f8eb511ad53b84edcf6770395d43512bee73e38ffad0e1b59850e7732454abdf880266307cf5fd396ac516ef1f9489d4fb592a455b'
  'SKIP'
  '156d6c377315044ccb081cddd28d932927139674a67bd2e6ef47c3030dcf58ccf4168936b823a8efad63ffcedc57f700654ce38223f8dc5c25bfc39051fa1389'
  '0a991fc5debf7a9f56223083f255094733feaec23166f621e2e77c4f9886e98be9ba4989a66c3889d0424e0d0d2df6f98c229e8ce00e3da2f20bea2c0b333e7b'
  '9abe05c8a9b14575cbd04318c8a9aecb0cc3593470cd69ede089c103b6a507c383be72f12e2f8240fa0edfac4d543be58c3e5f3d9106ecc3857783af90e57096'
  '113df3e27049294b62c18c54bc40b9121d53b232df2f94d01703740e9e1646662aebff35e3b25946effa9e32c59721e76e91e7fb21a00a4ca5417f9b074f33c6'
  '1efd42634d92859493cd30a36b6696cd5c748dcc533c09c88fe68a8f447f03708ffa11f93d2df5652e63e2c35cc4de7a59d71230c19eb9ff51b7c5dff1f383dd'
  'e85a55faf907b826cb5fa80505fb84e73090d0a31025695ffd6fb3356cd778a77d7fdf30da6e036e44408edc63b63920340075dbeb969a99181440f0c391060d'
  'd57a24d7cea93a0ef35ed452c865095ffce638fa9cf020592a18afe9f03d6d23b607aa16ed0a94d0d180380a2ec84d16cf43aed520c1f638785690215d4af423'
  '8ebf49c8a2e777cfde0fe0563cdccdd5c5b01072f5b1f513f1b9e42695ec32432358ee08d53c2f514dc5e0b6756a270c3598968f3706a05e10ae7cff507f9380'
  '9e429ffbac68a20afaeb324e63b2e688fcbb063d7132b8cc1e16855861225f13298ec67e55fe74ec64290c2e2930e1e19d487ca653b0cb64bb42c607cf4c666c'
  'c3fb463b7339d385c19a438f508ce92012eee16e36dc7710ef665354001f5c0faec1ca2ad2dda6e061d1dac5bfacaa8518e58e5d5594e473615fe564935b6253'
  'cb6add9fa39df78498055be1aeb4230fbd55e8bef9f92d37c049a1a3d00f776d7df3e4a248397c06db8c54d0be4fb8cd4d301b349903f74796b9ea753c6e751c'
  '5634114e3418e894506206b30030af9a4465fdb2d4c8f15e5e81eaadb086c7fdce8c54835309548d42b7776ee1803c638fc2e2aa23f3363cfc395ffffd741a3e'
  'fa0f84749e31ded529bf9e947ac0fe3fbbe46aafae2309c82189d87b361987aa8ba9a8aace9bbbf656dbc0d966e60a5c60b3ef5199b2cd7a2853c98b6e1356ae'
  '4452b0b5fe7952cc16633322e3a868cf3a5794c0346d3e5e6b9dcc100227c73cd64f456039252c703ce8545d19377ecd6f7f2cd1246c192d99b28a9be385b4e9'
  'a2c3a01249155bb5b82648a74b9f4ebe6a5363cb198c4d6d9460605587bd730e8dddeaa13592c7a388b496cbda32355606ba093f979790de29b34d52c3a67e15'
  'a834c36896e324de7c1694b36a381686738a786583dedb18d708fe29276737810bb654656cac2f9513fd370855f738d42b50a4aee9ce0b6f06748c92d8859ab8'
  'cef50ea9e5ee165b1c7d9342e3e472ba967f7d75e854337a784978b8e1f4c0c1d855eeed12c40a340ed814e4693571f253fb3c692b442de99233310b1158b4b5'
  '084afa36685393c0806165c8c897553c0df876e6aaa86d28020064f40f3cc25d0ad69163d3abe183c898df6fc92f5ff4685969bb7a9cdf477efbb4b8eb986cda'
  '54c1386ffdc6c6efdbedccdaddffedc78e3e7c31f7b4de7cec0561a28f5364123cb776216efc39cadec5292488d06a8a49ed9d65ed244f4b1d724215ca8283ab'
  'f427709e7137dd0249070ffa3aedaf9c04b434172d56d8d453ada2d0c439c2b31a9c82551da5c993468fc286edba756d86073268894394ba5190fc1475ca09b3'
  '3a4c60a485304553ee1ca87ac0e96ba636cb8f0a311c71a0a73b3926964a3ff700c7cca6d24ddef04547dd90bd58f6dec26d137da6286d1c409ebcd6e6ed2bf2')
b2sums=('80681ad0378521bc27756add78ac4c66c81d53b28016efc37b4f1a7d82b598a370bd6a90a277dd66f08ed08bde169f142c51e2f424de3176c939dad21a131575'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'a596fe2649f4f9d5644b3abe7df3fa1d921ec378324691f04e17df60e3ebec39f3877ecb68519b71fde1a0a8144e48b35556febb241fa3cc631794c7e866f8d5'
  'SKIP'
  'c1d68f624e55bec3af3e4a3b1461bf420e6ce03ada499d0eff39a14e76494ef2502ee56a6f3da1e442209b4f10165d7b2b026b9efad982c6e40cfd0d5dd323d3'
  '3f24351caa24fc969e2b85ea343df270e39b2679cef5ca5e5ce3c8a36735cf9b44ecc3d55bdb2343377ecc9efce386e308b4f45e1d6d48380d155b56c6611ba2'
  '0001251324fb1c43da0676f7e7da4f01667273b8095afbbb539a760288aba6ad782ced95d7863ee671449f526009dd1141a65c217a502118ff35338d1ee4f32e'
  '273d3325c79b800b52b83e1af11011224d7fdaa67dd49b0ef4105c3211b467dddce22aed27fc3476356195f2539703e1a96e42a9437ea6f5d1b0b9a6a7eb3122'
  'd826c2dd98b0199c5a351c5ec340e27490108f667445b42b5884d1d2a5be23b0b8beec288266d4ead602569e363c81fed570eac2732cf0be6a05bd557b9cf0a4'
  '634cebeb610aafd6ee1067d6d76afdbf93c7fd95227f2d47656a5d61395441471c4ec6d30995ff3c80f649c38c488ec272a95e8d0080288d5217fc8197ef8954'
  '75ec7373286f5d7cd778e6738609679c95aff00ce13eb9b451a3156dcd1da3191862f587b8b01ff4f056c1348529267fe34246bf63574aeb7f10b13a7b6db612'
  '4493c5b2a1196497e8f54ee009ad29863545e4afff94ff23b0f19d33cdb479d4f5ebfd6c0c028a649d198a054a11dfdd570ba673be64da0562a13143bb013457'
  'a2d51f38244b4ce2fbc05d4d8a15e724d2ce014ce47a3be63586fe21a07a8f24a9ba0cb41b55a9366b528c1e55b25c194a0c409e781eddc1fc477eb2ff9704e5'
  '5f91ab88356ec857e805ffda9f3ce63f2e3dcbdd538b1f772ea2a1588c3cfb7a27923690ad703af2ca3209e5d337e5635c9d7304505d60200632fdbabc0074cc'
  '402321cd85e0a1ee6cfb67d75b64ebe0fadc09d521e823049c5859f8585e159376e4f776edd5083d0dd395d49e6fe3f8aa94644c319854be45a2e11b355d890a'
  'f86955655433526c10e56495e57ac546620a5fe7fe9e804669a80823bf7a782667907276ed06bd4905a05b640f947f6cad7a8b087acd26bbd7d191cb90ebe457'
  '1752e3dc7bc710c20befbf830bf42b6849741bff30d768832643a54b5d3cb26239e3ce99e063a4e122367fbbfee2caa386f911c32d268b54d73b9123d041234e'
  '937f24ed626f9726388b3c3b52b2051df8aecd324e145aebf5b2c9ae714368e13b26473183378ba994c0fd9dcf0c051dfa7050c0c54c8e31f6d2b22ce2e3d065'
  '2657284b743f511006ed47f551fe42e6e04008b4233d2691506fba4d4e70e211b9c1ac8903c7ae551d6f00cf08630510d90ef6b2b5b735daae468791ca54737f'
  'd2b777f0a3fd93ba69bd52026a802e16936930e7766cce6276c92652cd65a2a8538c3247ef8b5a50d90c063285e471454812b010a0f7103664e75324e036a04c'
  '8605e4d0f04090cf9e53805260a2a93e19e3363e47b3e5ed069b61a51916ed3bb4b03fb1e94530ec0f8f6fbffc65adcb5b3338e6e4ea2b729f4af5c0c12f4bb7'
  '6a7a7c578f22af05c0a6617a621c36add3f6f287f73d64d127dc91952acf5a1c71c619b3513fdb8ab4bb5767c57dee81fbbcd616f4f6c9163189f9d6002f8fad'
  'e8f46cfa4744c5ea62c28369a7c81a9027a389dbb6573495279b084ff99b6a39d114097788278c2be84237da7b7986c310bd6a6069fe3896cb234784181bcf68'
  'b856088fc19f7c921a5e2b3320a776e27b10a8d3d77c21041cb59348b2efde62491163c57227080c0091eb77e74c0d1fc2c0b72a01e0770df27777dc077ad600'
  '670fb582edac8bdef05a3842edbef464c5238861df80fbf5e788fe2752275db395826c0b6eb90d5c9fd725b2a368b8d7884aea9de6d89adde6032c481a6311b8')

# Clang, like upstream's builds: the code builds with -Werror, and GCC 16 has warnings Clang
# doesn't (sign comparisons, attributes of fclose in a unique_ptr's deleter type, …)
_compilers() {
  local _cc=clang
  # A cross build ($CARCH differs from the build host) compiles with clang and lld against the C
  # library and GCC of a root file system for $CARCH with base-devel in ROOTFS_DIR, like
  # powershell-dsc, with a makepkg configuration for $CARCH (CFLAGS, LDFLAGS)
  if [[ "$(uname -m)" != "$CARCH" ]]; then
    if [[ ! -d "${ROOTFS_DIR:-}" ]]; then
      echo "sourcemod: a cross build needs ROOTFS_DIR set to a $CARCH root file system" >&2
      exit 1
    fi
    # lld in the compiler command, as AMBuild links its test programs without LDFLAGS; compiling
    # doesn't use it, which the code's -Werror would turn into an error
    _cc="clang --target=$CARCH-unknown-linux-gnu --sysroot=$ROOTFS_DIR -fuse-ld=lld"
    _cc+=" -Wno-unused-command-line-argument"
  fi
  export CC="$_cc" CXX="${_cc/clang/clang++}"
}

prepare() {
  cd sourcemod || exit
  local _submodule
  for _submodule in public/amtl sourcepawn hl2sdk-manifests public/safetyhook; do
    git submodule init "$_submodule"
    git config "submodule.$_submodule.url" "$srcdir/${_submodule##*/}"
  done
  # Checked out again (--force), as makepkg only resets SourceMod's checkout when it's built again:
  # the submodules keep the previous build's patches otherwise
  git -c protocol.file.allow=always submodule update --force public/amtl sourcepawn \
    hl2sdk-manifests public/safetyhook

  # --scripting-only builds SafetyHook as well, which only the extensions use and which doesn't
  # support aarch64, and doesn't allow aarch64 on Linux, only on macOS
  # (https://github.com/alliedmodders/sourcemod/pull/2608)
  patch -Np1 -i "$srcdir/scripting-only.patch"
  # The MySQL extension with MariaDB Connector/C, linked dynamically, instead of a static MySQL 5.5
  # (without the latter's internal headers)
  patch -Np1 -i "$srcdir/mysql-mariadb.patch"
  # The PostgreSQL extension with the system's libpq, linked dynamically, instead of a static 9.6
  patch -Np1 -i "$srcdir/pgsql-libpq.patch"
  # The regex extension with the system's PCRE2, linked dynamically, instead of a static PCRE 8.44
  # (PCRE 1, end of life): translates regex.inc's PCRE flags and error codes. Without PCRE's limit of
  # 20 groups and matches, empty matches of MatchAll advance, and GetSubString keeps to maxlen.
  patch -Np1 -i "$srcdir/regex-pcre2.patch"
  # The webternet extension, which the updater downloads with, with the system's libcurl, linked
  # dynamically, instead of a static curl 7.19 without TLS; the update server over HTTPS
  patch -Np1 -i "$srcdir/webternet-curl.patch"
  # The SQLite extension with the system's SQLite 3, linked dynamically, instead of the bundled
  # amalgamation (3.38); SourcePawn (the VM and the compiler) with the system's zlib
  patch -Np1 -i "$srcdir/sqlite-system.patch"
  patch -Np1 -i "$srcdir/sourcepawn-zlib.patch"
  # spcomp's __DATE__ and __TIME__, which every plugin has in its version info (core.inc), from
  # SOURCE_DATE_EPOCH in UTC if it's set, so that plugins build reproducibly
  # (https://github.com/alliedmodders/sourcepawn/pull/1204, merged for SourcePawn 1.13 as
  # alliedmodders/sourcepawn@36252599)
  patch -Np1 -i "$srcdir/sourcepawn-source-date-epoch.patch"
  # spshell and the verifier, which include the VM's environment.h, with the VM's SP_HAS_JIT, so
  # that its Environment class is the same in them as in the VM library they link (GCC's LTO
  # reports the ODR violation). Upstream fixed it for 1.13 (alliedmodders/sourcepawn@bfdd959).
  patch -Np1 -i "$srcdir/sourcepawn-shell-jit-define.patch"
  # The JIT's writes of displacements and addresses into its code buffer, which are rarely aligned,
  # with memcpy instead of a cast to an int32_t or pointer, and no memcpy from a null pointer for a
  # function without any instructions: both undefined behaviour, which UBSan reports on every start
  # (memcpy compiles to the same moves)
  patch -Np1 -i "$srcdir/sourcepawn-jit-unaligned.patch"
  # spcomp's number literals and the negation of constants in unsigned arithmetic, so that they wrap
  # around like the VM's (0xFFFFFFFF, -(-2147483648)) instead of overflowing, which is undefined.
  # SourcePawn 1.13's compiler doesn't have this code anymore.
  patch -Np1 -i "$srcdir/sourcepawn-compiler-overflow.patch"
  # The replacement operator delete of extensions and logic.so declared noexcept, like the
  # standard's (implicitly so already; GCC warns about the different exception specifier)
  # (https://github.com/alliedmodders/sourcemod/pull/2607)
  patch -Np1 -i "$srcdir/sourcemod-delete-noexcept.patch"
  # No unaligned accesses, which are undefined behaviour and which UBSan reports on every start: the
  # memory tables (BaseMemTable, behind the phrases, the admin cache and others) align their blocks
  # like malloc does, as callers keep structures in them; the string tables' hash reads its bytes one
  # by one; the JIT helpers of extensions (JitWriter) write with memcpy
  patch -Np1 -i "$srcdir/sourcemod-unaligned-access.patch"
  # AMTL's integer hashes (HashInt32, HashInt64, behind every hash table with integer or pointer keys)
  # computed in unsigned arithmetic: in signed, their multiplications and shifts overflow, which is
  # undefined. Clang with LTO folds such a hash differently where a key is a constant, so a table
  # doesn't find an entry it added: DHooks never called detours' pre-callbacks (CHook's handlers by
  # HOOKTYPE_PRE). The hash values change, which only matters within a process.
  # (https://github.com/alliedmodders/amtl/pull/142)
  patch -Np1 -d public/amtl -i "$srcdir/amtl-hash-unsigned.patch"
  # Gamedata of the engine's library ("library" "engine") on games based on CS:GO's engine, like Day of
  # Infamy and Insurgency: their dedicated servers' EXECUTABLE_PATH is the server's root, not bin/
  # with engine_srv.so, so SourceMod searches bin/ under it as well.
  # (https://github.com/alliedmodders/sourcemod/pull/2611)
  patch -Np1 -i "$srcdir/sourcemod-gamebin-executable-path.patch"
  # The GeoIP extension with the system's libmaxminddb, linked dynamically, instead of the bundled
  # 1.5.2
  patch -Np1 -i "$srcdir/geoip-libmaxminddb.patch"
  # Without the gamedata updates from SourceMod's update server (the updater extension isn't loaded):
  # a newer SourceMod comes as a whole with this package
  sed -i -e 's/^\(\t \* The default value is \)"no"\.\( A value of "yes" will block the Auto Updater\.\)/\1"yes" (the package updates SourceMod as a whole).\2/' \
    -e 's/^\(\t"DisableAutoUpdate"\t*\)"no"/\1"yes"/' configs/core.cfg
  grep -q '^.*"DisableAutoUpdate"[[:space:]]*"yes"' configs/core.cfg || exit

  # Nothing prebuilt: the libraries of PCRE and libpq with their old headers, and tools the build
  # doesn't use
  rm -r extensions/regex/lib_* extensions/pgsql/lib_*
  rm extensions/regex/pcre.h
  rm -r extensions/curl/curl-src extensions/sqlite/sqlite-source sourcepawn/third_party/zlib
  rm extensions/pgsql/{libpq-fe.h,postgres_ext.h}
  rm extensions/geoip/{data-pool.{c,h},maxminddb{.c,.h,_config.h,-compat-util.h},osdefs.h}
  rm tools/vtable_scanner/libiberty.a tools/batchtool/compile.exe

  # SafetyHook's inline hooks with the amalgamated Zydis.h of the Zydis.c built with it, rather than
  # one of the system's include path: their ZydisDecoder differs between Zydis 4.0 and 4.1, and the
  # decoder overwrote SafetyHook's stack, which crashed SourceMod 1.13's SDKTools at start
  patch -Np1 -d public/safetyhook -i "$srcdir/safetyhook-zydis-header.patch"
  # The rel32 of a call to a PIC thunk, at the start of a hooked function, read and written with
  # byte copies instead of unaligned int32_t accesses, which are undefined behaviour. SafetyHook's
  # main rewrote it without them (alliedmodders/safetyhook@e519cea), which SourceMod doesn't use yet.
  patch -Np1 -d public/safetyhook -i "$srcdir/safetyhook-thunk-unaligned.patch"

  # SafetyHook's Zydis, amalgamated from Zydis and Zycore at the release's commits by Zydis's
  # script, with the static build defines SafetyHook's copy starts with (without them, Zydis
  # declares its functions as imported from a shared library)
  cd "$srcdir/zydis" || exit
  git submodule init dependencies/zycore
  git config submodule.dependencies/zycore.url "$srcdir/zycore-c"
  git -c protocol.file.allow=always submodule update --force dependencies/zycore
  # The script names each source file with its path relative to Zydis's rather than its absolute
  # one, so the source doesn't depend on where it was built, and its pattern as a raw string, which
  # Python warns about otherwise (https://github.com/zyantific/zydis/pull/661)
  patch -Np1 -i "$srcdir/zydis-amalgamate-paths.patch"
  python assets/amalgamate.py >/dev/null
  local _zydis="$srcdir/sourcemod/public/safetyhook/zydis"
  grep -q '^#define ZYDIS_STATIC_BUILD$' "$_zydis/Zydis.h" || exit
  printf '#define ZYCORE_STATIC_BUILD\n#define ZYDIS_STATIC_BUILD\n' |
    cat - amalgamated-dist/Zydis.h >"$_zydis/Zydis.h"
  cp amalgamated-dist/Zydis.c "$_zydis/Zydis.c"
}

build() {
  _compilers

  # The compiler and include files for this architecture
  local _target
  case "$CARCH" in
    x86_64) _target=x86_64 ;;
    aarch64) _target=arm64 ;;
  esac
  mkdir -p "$srcdir/sourcemod/build-scripting"
  cd "$srcdir/sourcemod/build-scripting" || exit
  python ../configure.py --enable-optimize --scripting-only --targets="$_target"
  ambuild

  # The game server's addons, 32-bit x86 only
  [[ "$CARCH" == x86_64 ]] || return 0

  # Position-independent code, which upstream only builds for x86_64: clang's default PIE code calls
  # libstdc++'s functions (linked statically) directly, which needs text relocations in a library
  CFLAGS+=" -fPIC"
  # Every game of hl2sdk, for its servers' architectures. The SDKs' shared libraries (tier0,
  # vstdlib) are only linked against, the games bring their own. Against the installed
  # Metamod:Source's sources.
  mkdir -p "$srcdir/sourcemod/build-games"
  cd "$srcdir/sourcemod/build-games" || exit
  python ../configure.py --enable-optimize --sdks=present --targets=x86,x86_64 \
    --hl2sdk-root=/usr/lib/hl2sdk --mms-path=/usr/src/metamod-source --mysql-path=/usr \
    --mysql64-path=/usr
  ambuild
}

check() {
  # The compiler of a cross build is for another architecture, run the test natively on the target
  if [[ "$(uname -m)" != "$CARCH" ]]; then
    echo 'sourcemod: skipping the test on a cross build; run it natively on the target' >&2
    return 0
  fi
  cd sourcemod || exit
  # spcomp64 for x86_64, like in SourceMod's packages, spcomp for other architectures
  local _spcomp=(build-scripting/package/spcomp*)

  # The compiler's version is SourceMod's, and the include files it builds with compile
  [[ $("${_spcomp[0]}" 2>&1 | head -n1) == *"$pkgver"* ]]
  "${_spcomp[0]}" -i build-scripting/package/include -E -o "$srcdir/test.smx" plugins/basecommands.sp
  # Reproducibly, with makepkg's SOURCE_DATE_EPOCH: the same plugin a second later is the same
  sleep 1
  "${_spcomp[0]}" -i build-scripting/package/include -E -o "$srcdir/test-again.smx" plugins/basecommands.sp
  cmp "$srcdir/test.smx" "$srcdir/test-again.smx"

  # SourcePawn's tests: its compiler and VM, the scripting build's and the servers' 32 and 64-bit
  # ones
  python sourcepawn/tests/runtests.py build-scripting/sourcepawn
  [[ "$CARCH" == x86_64 ]] || return 0
  python sourcepawn/tests/runtests.py build-games/sourcepawn

  # The compilers of the servers' build, the 32-bit spcomp and spcomp64, compile the plugin to the
  # same file as the packaged one
  local _compiler
  for _compiler in build-games/package/addons/sourcemod/scripting/spcomp{,64}; do
    "$_compiler" -i build-scripting/package/include -E -o "$srcdir/test-${_compiler##*/}.smx" \
      plugins/basecommands.sp
    cmp "$srcdir/test.smx" "$srcdir/test-${_compiler##*/}.smx"
  done
}

_package_amtl_license() {
  # AMTL has no licence file, its licence is in each of its files
  sed -n 3,28p "$srcdir/sourcemod/public/amtl/amtl/am-string.h" | sed 's|^// \?||' |
    install -Dm644 /dev/stdin "$pkgdir/usr/share/licenses/${FUNCNAME[1]#package_}/AMTL.txt"
}

_package_rsa_md_license() {
  # The MD5 code of SourcePawn's VM and the updater extension, RSA's: its licence is in the files
  sed -n '/Copyright (C) 1991-2, RSA Data Security/,/documentation and\/or software\./p' \
    "$srcdir/sourcemod/sourcepawn/vm/md5/md5.cpp" |
    install -Dm644 /dev/stdin "$pkgdir/usr/share/licenses/${FUNCNAME[1]#package_}/RSA-MD.txt"
}

package_sourcemod-scripting() {
  pkgdesc="SourcePawn compiler (spcomp) and include files of SourceMod, for compiling SourceMod plugins"
  # The include files: GPL 3.0 with SourceMod's exceptions (licenses/LICENSE.txt), which aren't on
  # SPDX's list. spcomp: the Pawn compiler (zlib licence), SourcePawn (GPL 3.0 or later), AMTL (BSD
  # 3-clause).
  license=(
    GPL-3.0-only
    LicenseRef-SourceMod-exception
    GPL-3.0-or-later
    Zlib
    BSD-3-Clause
  )
  depends=(bash glibc libgcc libstdc++ zlib)
  provides=(spcomp)
  conflicts=(spcomp)

  local _package="$srcdir/sourcemod/build-scripting/package"
  local _spcomp=("$_package"/spcomp*)

  # The scripting folder of SourceMod's packages: the compiler, by the name of the 64-bit one, and
  # the include files, which plugins and extensions add theirs to. In PATH as spcomp64 and spcomp,
  # the 32-bit one's name, through spcomp.sh, which runs it by its path.
  local _scripting="$pkgdir/usr/lib/sourcemod/addons/sourcemod/scripting"
  install -Dm755 "${_spcomp[0]}" "$_scripting/spcomp64"
  install -Dm644 "$_package"/include/*.inc -t "$_scripting/include"
  install -Dm755 "$srcdir/spcomp.sh" "$pkgdir/usr/bin/spcomp64"
  ln -s spcomp64 "$pkgdir/usr/bin/spcomp"

  local _licenses="$pkgdir/usr/share/licenses/${FUNCNAME[0]#package_}"
  install -Dm644 "$srcdir/sourcemod/licenses/LICENSE.txt" -t "$_licenses"
  install -Dm644 "$srcdir/sourcemod/sourcepawn/LICENSE.txt" "$_licenses/SourcePawn.txt"
  _package_amtl_license
}

package_sourcemod() {
  pkgdesc="SourceMod, the scripting and administration platform for Source engine game servers, for the games of hl2sdk with Linux servers (the addons and cfg folders of a server)"
  arch=(x86_64)
  # SourceMod: GPL 3.0 with SourceMod's exceptions. SourcePawn (GPL 3.0 or later), AMTL and the
  # regex extension's error table of PCRE2 (BSD 3-clause), SourceHook of Metamod:Source and DHooks'
  # DynamicHooks (zlib licence), SafetyHook (Boost), Zydis, Zycore and core's alphanum comparison
  # (MIT), the MD5 code of SourcePawn's VM and the updater (RSA), the Source SDK's libraries
  # (source-sdk.txt).
  license=(
    GPL-3.0-only
    LicenseRef-SourceMod-exception
    GPL-3.0-or-later
    BSD-3-Clause
    Zlib
    BSL-1.0
    MIT
    RSA-MD
    LicenseRef-Source-SDK
  )
  # The games' 32-bit and 64-bit servers: SourcePawn's zlib, and SQLite of clientprefs' default
  # storage; bash for compile.sh. Metamod:Source of the same build as metamod-source-src, whose
  # interfaces are versioned and stay compatible, like SourceMod's for extensions.
  depends=(
    bash
    gcc-libs
    glibc
    lib32-gcc-libs
    lib32-glibc
    lib32-sqlite
    lib32-zlib
    metamod-source
    sqlite
    zlib
  )
  # The database clients of the MySQL and PostgreSQL extensions, which SourceMod loads when a plugin
  # connects through them, PCRE2 of the regex extension, which loads with a plugin that uses it (none
  # of SourceMod's), and curl of the webternet extension, which loads with the updater (disabled in
  # core.cfg), and libmaxminddb of the GeoIP extension, which loads with a plugin that uses it (none
  # of SourceMod's): 32-bit for the 32-bit servers, 64-bit for the 64-bit ones
  optdepends=(
    'lib32-mariadb-connector-c: the MySQL extension, 32-bit servers'
    'mariadb-libs: the MySQL extension, 64-bit servers'
    'lib32-postgresql-libs: the PostgreSQL extension, 32-bit servers'
    'postgresql-libs: the PostgreSQL extension, 64-bit servers'
    'lib32-pcre2: the regex extension, 32-bit servers'
    'pcre2: the regex extension, 64-bit servers'
    'lib32-curl: the webternet extension of the updater, 32-bit servers'
    'curl: the webternet extension of the updater, 64-bit servers'
    'lib32-libmaxminddb: the GeoIP extension, 32-bit servers'
    'libmaxminddb: the GeoIP extension, 64-bit servers'
    'geoipupdate: the GeoLite2 City database of the GeoIP extension'
  )

  # The addons and cfg folders of a game (e.g. doi/addons, doi/cfg), to copy into a server: the same
  # for each game, with the binaries of every game (*.2.<game>.so, x64/ for the 64-bit servers).
  # With the 32-bit compiler and compile.sh, as in SourceMod's packages; without spcomp64 and the
  # include files, which sourcemod-scripting has in the same folder. In /usr/lib, as it's mostly
  # libraries.
  install -d "$pkgdir/usr/lib/sourcemod"
  cp -r --no-preserve=ownership "$srcdir"/sourcemod/build-games/package/{addons,cfg} "$pkgdir/usr/lib/sourcemod/"
  rm -r "$pkgdir"/usr/lib/sourcemod/addons/sourcemod/scripting/{spcomp64,include}
  # The GeoIP extension's database, which SourceMod's build doesn't have: geoipupdate's, kept up to
  # date by its timer. The extension loads the first .mmdb file of configs/geoip, following
  # symlinks, and skips this one while it doesn't exist.
  ln -s /var/lib/GeoIP/GeoLite2-City.mmdb \
    "$pkgdir/usr/lib/sourcemod/addons/sourcemod/configs/geoip/GeoLite2-City.mmdb"

  local _licenses="$pkgdir/usr/share/licenses/${FUNCNAME[0]#package_}"
  install -Dm644 "$srcdir/sourcemod/licenses/LICENSE.txt" -t "$_licenses"
  install -Dm644 "$srcdir/sourcemod/sourcepawn/LICENSE.txt" "$_licenses/SourcePawn.txt"
  _package_amtl_license
  _package_rsa_md_license
  install -Dm644 /usr/src/metamod-source/LICENSE.txt "$_licenses/Metamod-Source.txt"
  install -Dm644 "$srcdir/sourcemod/public/safetyhook/LICENSE" "$_licenses/SafetyHook.txt"
  install -Dm644 "$srcdir/zydis/LICENSE" "$_licenses/Zydis.txt"
  install -Dm644 "$srcdir/zycore-c/LICENSE" "$_licenses/Zycore.txt"
  install -Dm644 "$srcdir/source-sdk.txt" -t "$_licenses"
}

package_sourcemod-src() {
  pkgdesc="SourceMod's sources the sourcemod packages are built from, with their patches, for building extensions against it (--sm-path=/usr/src/sourcemod)"
  arch=(any)
  # As sourcemod's, without the Source SDK's libraries
  license=(
    GPL-3.0-only
    LicenseRef-SourceMod-exception
    GPL-3.0-or-later
    BSD-3-Clause
    Zlib
    BSL-1.0
    MIT
    RSA-MD
  )

  # The tree of the build after prepare(), with its submodules (AMTL, SourcePawn, the SDK
  # manifests, SafetyHook with the regenerated Zydis), without the builds and git's files,
  # read-only: builds against it write into their own build folders. Without tools/ (maintainer
  # scripts and a PCRE 8 source for building the regex extension's old library), AMTL's googletest,
  # which no build uses, and SourcePawn's AMTL, an empty submodule (SourceMod builds it with its
  # own).
  install -d "$pkgdir/usr/src/sourcemod"
  tar -C "$srcdir/sourcemod" --exclude=.git --exclude=./build-scripting --exclude=./build-games \
    --exclude=__pycache__ --exclude=./tools --exclude=./public/amtl/third_party \
    --exclude=./sourcepawn/third_party -c . |
    tar -C "$pkgdir/usr/src/sourcemod" -x --no-same-owner

  local _licenses="$pkgdir/usr/share/licenses/${FUNCNAME[0]#package_}"
  install -Dm644 "$srcdir/sourcemod/licenses/LICENSE.txt" -t "$_licenses"
  install -Dm644 "$srcdir/sourcemod/sourcepawn/LICENSE.txt" "$_licenses/SourcePawn.txt"
  _package_amtl_license
  _package_rsa_md_license
  install -Dm644 "$srcdir/sourcemod/public/safetyhook/LICENSE" "$_licenses/SafetyHook.txt"
  install -Dm644 "$srcdir/zydis/LICENSE" "$_licenses/Zydis.txt"
  install -Dm644 "$srcdir/zycore-c/LICENSE" "$_licenses/Zycore.txt"
}
