# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgbase=sourcemod-dev
pkgname=(sourcemod-dev-scripting sourcemod-dev sourcemod-dev-src)
# SourceMod's development builds: the tags of master's builds (1.13, released by upstream as
# prereleases), <version>.<build>, the build being the number of commits, which SourceMod's
# versioning counts with git
pkgver=1.13.0.7484
pkgrel=1
pkgdesc="SourceMod, the scripting and administration platform for Source engine game servers (development builds)"
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
# the tag pins, SourcePawn's too: googletest (its tests), its fork of mimalloc and capstone.
source=("git+https://github.com/alliedmodders/sourcemod.git#tag=$_tag"
  "git+https://github.com/alliedmodders/amtl.git"
  "git+https://github.com/alliedmodders/sourcepawn.git"
  "git+https://github.com/google/googletest.git"
  "git+https://github.com/alliedmodders/mimalloc.git"
  "git+https://github.com/capstone-engine/capstone.git"
  "git+https://github.com/alliedmodders/hl2sdk-manifests.git"
  "git+https://github.com/alliedmodders/safetyhook.git"
  "git+https://github.com/zyantific/zydis.git#tag=v$_zydisver"
  "git+https://github.com/zyantific/zycore-c.git"
  scripting-only.patch
  mysql-mariadb.patch
  mysql-tls-verify.patch
  pgsql-libpq.patch
  regex-pcre2.patch
  webternet-curl.patch
  sqlite-system.patch
  sourcepawn-zlib.patch
  sourcepawn-source-date-epoch.patch
  sourcemod-delete-noexcept.patch
  geoip-libmaxminddb.patch
  source-sdk.txt
  spcomp.sh)
sha512sums=('0e64d64e3ae313761c182b46fde75fe0c73d73338585bf9f2d598f0ec2079f9177c0b9fcc0e64731264c5a1bb355f39ef2f7e43a12375be6554a73249ab5b80c'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  '7ca4fc08ad5074f7ae7115f8eb511ad53b84edcf6770395d43512bee73e38ffad0e1b59850e7732454abdf880266307cf5fd396ac516ef1f9489d4fb592a455b'
  'SKIP'
  '156d6c377315044ccb081cddd28d932927139674a67bd2e6ef47c3030dcf58ccf4168936b823a8efad63ffcedc57f700654ce38223f8dc5c25bfc39051fa1389'
  '2bbf37d5b0918cb3fa576e7b44537b2bd6b6feecb193a9bfd25d107e875cc4c8f9b7c92e3446649509f0e9b2d1d791e3f4880794603094b8d46c0602d358ce0e'
  '561d8768979ad1af37a8988d63115d91be9098171030c8c97089d774fe8212aad2a80932708a2ac3161d5da5edbc710abf917a4cedd861e9b6b09a4e89f2cd27'
  '45453da3489806c4acedcff7876fad632a9e8d9390c21f75c4386f2019f3d7598e04b620b57cec6ccd82623394b36ee5481f41122b6c7deac22a64bad1698f79'
  'eba2aead936cc6b544c341c1b83fc25af17e876f84ff57a998fc11eda4fa6f30a2bd3ef9db4a15b7d9bcd1d3ea847e0929dc23a078b884d0cf5d40fbd835f676'
  '7d44b791fa1298810c95736017d90632a7f293ee18fc27c3ddf7f702fc023ee381f06e125e75a45fd02171e1e0fc47f89a10d322e620395fdf3ab4e27a4b1113'
  '0d099ef8459feb0ccb4df4bcc7a447ab22a8bc20dccfe7d41ab7bc01fec89955616ab5d223ec02b5490b45b67de12f6119000ec28e04d8bac9c70957f0115e0a'
  'ec7b87123e13badefd397af96f9d5827473b5ce9b879ad5b58d4e6073efe7ea9875bcb845c0b367dc802ab871552af6636b50ad29c7a365783929f43a5701ee9'
  'aa65bb5d45798d4036a3b532093ab2f35a161a1d424d0430299f9c31c3552d7601a898c326eb8b5b08924ff7328e78aac183c10788b7e5dcc3d8f14d0ccff252'
  '5634114e3418e894506206b30030af9a4465fdb2d4c8f15e5e81eaadb086c7fdce8c54835309548d42b7776ee1803c638fc2e2aa23f3363cfc395ffffd741a3e'
  '084afa36685393c0806165c8c897553c0df876e6aaa86d28020064f40f3cc25d0ad69163d3abe183c898df6fc92f5ff4685969bb7a9cdf477efbb4b8eb986cda'
  'f427709e7137dd0249070ffa3aedaf9c04b434172d56d8d453ada2d0c439c2b31a9c82551da5c993468fc286edba756d86073268894394ba5190fc1475ca09b3'
  '3a4c60a485304553ee1ca87ac0e96ba636cb8f0a311c71a0a73b3926964a3ff700c7cca6d24ddef04547dd90bd58f6dec26d137da6286d1c409ebcd6e6ed2bf2')
b2sums=('ed80eee3d79d284917fb41985f4680f1ce913ee117a08288423841788f7fd3eb26c982f2e97ad8f24a739684a94ab02d6d86cdce1fb34d2a0dfbe6203dd42fb6'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'a596fe2649f4f9d5644b3abe7df3fa1d921ec378324691f04e17df60e3ebec39f3877ecb68519b71fde1a0a8144e48b35556febb241fa3cc631794c7e866f8d5'
  'SKIP'
  'c1d68f624e55bec3af3e4a3b1461bf420e6ce03ada499d0eff39a14e76494ef2502ee56a6f3da1e442209b4f10165d7b2b026b9efad982c6e40cfd0d5dd323d3'
  '514c5aad91735629f63689e37e5631855fdad22ec644c1abb3fe356c49638fc755b51fe75c322f4afb2b75332cdc6d767b8345e177d1c8ab36198c80a478e9ba'
  'de313dca87e5753b3a673587798d47c1259297cf9d22e5951a0e41f8b1055b2d806f36352f1b1228410c2a981e34e1c515fac1d0c41bf892e4ceb0221ff7a1c4'
  '681e09df711c79ed4e1cde460afdb15c089c1a784e3fe2fe8b3475ada4a48105924c2c23c9a03165f8f59f39a2b2d4707dece21919bc907df7e257df16092c3f'
  '5d1fbca72e2da61aea85526e9d0c3661084833bbe79d4b807d04bf4e77ae8a83ee2edcef6376eae01e874d8dce271842e470424fc8704c90198387df4fae5d3f'
  'e9bbde3a7c72236c2b7f9cea23a49683264d6c1646cfb88310ebf3c20b435f5eaf05d689e8f334a19c2fdd2a27f25386aab09667ac91971256208e2e0ef0c184'
  '5b706c6b3f4157bc817c95ab499f0d1f980c2b7d04a3057d502d86a6f1abe90c961f2a6335f102e68bc6edfe4bb4d25aae8bbe5edbf942c8dd36d83e0357084b'
  'f19c6c50dc6567bb97cd18e2fb837fa7b17183de8a96bc44f000973ba79a8b52a2f11d8313c802cb8b7cf667edda594cbbb92ef9aa9915b85693fac06ebddffe'
  'edbc0ece20302ab90994b03e112542cb13410b42db62983204bbf888d3d4f7802633a91d2ba680f2a4473ae95b9d38f1f0eeaae08f82ee2499dc84cd627269f1'
  'f86955655433526c10e56495e57ac546620a5fe7fe9e804669a80823bf7a782667907276ed06bd4905a05b640f947f6cad7a8b087acd26bbd7d191cb90ebe457'
  '6a7a7c578f22af05c0a6617a621c36add3f6f287f73d64d127dc91952acf5a1c71c619b3513fdb8ab4bb5767c57dee81fbbcd616f4f6c9163189f9d6002f8fad'
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
  git -c protocol.file.allow=always submodule update public/amtl sourcepawn hl2sdk-manifests \
    public/safetyhook
  # SourcePawn's, without its AMTL, as SourceMod builds it with its own
  local -A _sourcepawn=(["third_party/gtest"]=googletest ["third_party/mimalloc"]=mimalloc
    ["third_party/capstone"]=capstone)
  for _submodule in "${!_sourcepawn[@]}"; do
    git -C sourcepawn submodule init "$_submodule"
    git -C sourcepawn config "submodule.$_submodule.url" "$srcdir/${_sourcepawn[$_submodule]}"
  done
  git -C sourcepawn -c protocol.file.allow=always submodule update "${!_sourcepawn[@]}"

  # --scripting-only builds SafetyHook as well, which only the extensions use and which doesn't
  # support aarch64, and doesn't allow aarch64 on Linux, only on macOS
  patch -Np1 -i "$srcdir/scripting-only.patch"
  # The MySQL extension with the system's MariaDB Connector/C, linked dynamically, instead of a
  # static one with a static OpenSSL
  patch -Np1 -i "$srcdir/mysql-mariadb.patch"
  # Connector/C's verification of the server's certificate, which 1.13 turns off for every
  # connection (alliedmodders/sourcemod@7b2eaa5), like 1.12: connections over the network need
  # TLS with a certificate the system trusts, local ones (a UNIX socket) don't
  patch -Np1 -i "$srcdir/mysql-tls-verify.patch"
  # The PostgreSQL extension with the system's libpq, linked dynamically, instead of a static 18.4
  patch -Np1 -i "$srcdir/pgsql-libpq.patch"
  # The regex extension with the system's PCRE2, linked dynamically, instead of a static PCRE 8.44
  # (PCRE 1, end of life): translates regex.inc's PCRE flags and error codes
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
  # (https://github.com/alliedmodders/sourcepawn/pull/1204)
  patch -Np1 -i "$srcdir/sourcepawn-source-date-epoch.patch"
  # The replacement operator delete of extensions and logic.so declared noexcept, like the
  # standard's (implicitly so already; GCC warns about the different exception specifier)
  # (https://github.com/alliedmodders/sourcemod/pull/2607)
  patch -Np1 -i "$srcdir/sourcemod-delete-noexcept.patch"
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

  # SafetyHook's Zydis, amalgamated from Zydis and Zycore at the release's commits by Zydis's
  # script, with the static build defines SafetyHook's copy starts with (without them, Zydis
  # declares its functions as imported from a shared library)
  cd "$srcdir/zydis" || exit
  git submodule init dependencies/zycore
  git config submodule.dependencies/zycore.url "$srcdir/zycore-c"
  git -c protocol.file.allow=always submodule update dependencies/zycore
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
    --hl2sdk-root=/usr/lib/hl2sdk --mms-path=/usr/src/metamod-source --mariadb-path=/usr \
    --mariadb64-path=/usr
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

_package_mimalloc_license() {
  # SourcePawn's fork of mimalloc, which the compilers and the VM (logic.so) link
  install -Dm644 "$srcdir/sourcemod/sourcepawn/third_party/mimalloc/LICENSE" \
    "$pkgdir/usr/share/licenses/${FUNCNAME[1]#package_}/mimalloc.txt"
}

_package_rsa_md_license() {
  # The MD5 code of SourcePawn's VM and the updater extension, RSA's: its licence is in the files
  sed -n '/Copyright (C) 1991-2, RSA Data Security/,/documentation and\/or software\./p' \
    "$srcdir/sourcemod/sourcepawn/vm/md5/md5.cpp" |
    install -Dm644 /dev/stdin "$pkgdir/usr/share/licenses/${FUNCNAME[1]#package_}/RSA-MD.txt"
}

package_sourcemod-dev-scripting() {
  pkgdesc="SourcePawn compiler (spcomp) and include files of SourceMod, for compiling SourceMod plugins (development builds)"
  # The include files: GPL 3.0 with SourceMod's exceptions (licenses/LICENSE.txt), which aren't on
  # SPDX's list. spcomp: SourcePawn and AMTL (BSD 3-clause, SourcePawn's licence file the zlib
  # licence), mimalloc (MIT).
  license=(
    GPL-3.0-only
    LicenseRef-SourceMod-exception
    BSD-3-Clause
    Zlib
    MIT
  )
  depends=(bash glibc libgcc libstdc++ zlib)
  provides=(spcomp "sourcemod-scripting=$pkgver")
  conflicts=(spcomp sourcemod-scripting)

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
  _package_mimalloc_license
}

package_sourcemod-dev() {
  pkgdesc="SourceMod, the scripting and administration platform for Source engine game servers, for the games of hl2sdk with Linux servers (development builds)"
  arch=(x86_64)
  # SourceMod: GPL 3.0 with SourceMod's exceptions. SourcePawn, AMTL and the regex extension's
  # error table of PCRE2 (BSD 3-clause, SourcePawn's licence file the zlib licence), SourceHook of
  # Metamod:Source and DHooks' DynamicHooks (zlib licence), SafetyHook (Boost), Zydis, Zycore,
  # mimalloc and core's alphanum comparison (MIT), the MD5 code of SourcePawn's VM and the updater
  # (RSA), the Source SDK's libraries (source-sdk.txt).
  license=(
    GPL-3.0-only
    LicenseRef-SourceMod-exception
    BSD-3-Clause
    Zlib
    BSL-1.0
    MIT
    RSA-MD
    LicenseRef-Source-SDK
  )
  # The games' 32-bit and 64-bit servers: SourcePawn's zlib, and SQLite of clientprefs' default
  # storage; bash for compile.sh. Metamod:Source of the same build as metamod-source-src, whose
  # interfaces are versioned and stay compatible, like SourceMod's for extensions: 1.12, which
  # SourceMod's own 1.13 builds use too.
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
  provides=("sourcemod=$pkgver")
  conflicts=(sourcemod)

  # The addons and cfg folders of a game (e.g. doi/addons, doi/cfg), to copy into a server: the same
  # for each game, with the binaries of every game (*.2.<game>.so, x64/ for the 64-bit servers).
  # With the 32-bit compiler and compile.sh, as in SourceMod's packages; without spcomp64 and the
  # include files, which sourcemod-dev-scripting has in the same folder. In /usr/lib, as it's mostly
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
  _package_mimalloc_license
}

package_sourcemod-dev-src() {
  pkgdesc="SourceMod's sources the sourcemod-dev packages are built from, with their patches, for building extensions against it (--sm-path=/usr/src/sourcemod)"
  arch=(any)
  # As sourcemod-dev's, without the Source SDK's libraries, with SourcePawn's capstone (BSD
  # 3-clause, its LLVM parts NCSA), which no binary links
  license=(
    GPL-3.0-only
    LicenseRef-SourceMod-exception
    BSD-3-Clause
    NCSA
    Zlib
    BSL-1.0
    MIT
    RSA-MD
  )
  provides=("sourcemod-src=$pkgver")
  conflicts=(sourcemod-src)

  # The tree of the build after prepare(), with its submodules (AMTL, SourcePawn, the SDK
  # manifests, SafetyHook with the regenerated Zydis, SourcePawn's mimalloc and capstone), without
  # the builds and git's files, read-only: builds against it write into their own build folders.
  # Without tools/ (maintainer scripts and a PCRE 8 source for building the regex extension's old
  # library), AMTL's and SourcePawn's googletest, only for their tests, SourcePawn's AMTL, an empty
  # submodule (SourceMod builds it with its own), and mimalloc's prebuilt Windows DLLs (bin/).
  install -d "$pkgdir/usr/src/sourcemod"
  tar -C "$srcdir/sourcemod" --exclude=.git --exclude=./build-scripting --exclude=./build-games \
    --exclude=__pycache__ --exclude=./tools --exclude=./public/amtl/third_party \
    --exclude=./sourcepawn/third_party/amtl --exclude=./sourcepawn/third_party/gtest \
    --exclude=./sourcepawn/third_party/mimalloc/bin -c . |
    tar -C "$pkgdir/usr/src/sourcemod" -x --no-same-owner

  local _licenses="$pkgdir/usr/share/licenses/${FUNCNAME[0]#package_}"
  install -Dm644 "$srcdir/sourcemod/licenses/LICENSE.txt" -t "$_licenses"
  install -Dm644 "$srcdir/sourcemod/sourcepawn/LICENSE.txt" "$_licenses/SourcePawn.txt"
  _package_amtl_license
  _package_rsa_md_license
  install -Dm644 "$srcdir/sourcemod/public/safetyhook/LICENSE" "$_licenses/SafetyHook.txt"
  install -Dm644 "$srcdir/zydis/LICENSE" "$_licenses/Zydis.txt"
  install -Dm644 "$srcdir/zycore-c/LICENSE" "$_licenses/Zycore.txt"
  _package_mimalloc_license
  local _capstone="$srcdir/sourcemod/sourcepawn/third_party/capstone"
  install -Dm644 "$_capstone/LICENSE.TXT" "$_licenses/capstone.txt"
  install -Dm644 "$_capstone/LICENSE_LLVM.TXT" "$_licenses/capstone-LLVM.txt"
}
