# Maintainer:

## options
: ${_scripts:=scripts/deps}
: ${_clang_ver=19}

: ${_url:=https://github.com/stenzek/duckstation}
: ${_commit:=aa955b8ae28314ae061613f0ddf13183a98aca03} # 0.1.r7465

_pkgname="duckstation"
pkgbase="$_pkgname"
pkgname=("$_pkgname" "$_pkgname-gpl")
pkgver=0.1.7465
pkgrel=6
pkgdesc="Playstation emulator"
url="$_url/commits/$_commit"
arch=('x86_64')

depends=(
  ## duckstation
  'libwebp'
  'libxrandr'
  'qt6-base'
  'sdl2'
)
makedepends=(
  ## compiler
  "clang${_clang_ver}"
  "lld${_clang_ver}"
  "llvm${_clang_ver}"

  ## build
  'cmake'
  'extra-cmake-modules'
  'git'
  'ninja'

  ## duckstation
  'qt6-tools'
  'qt6-wayland'

  ## shaderc
  'python'

  ## fixups
  'imagemagick'
  'patchelf'
)

_source_duckstation() {
  license=('GPL-3.0-only')

  _pkgsrc="$_pkgname"
  source=(
    "$_pkgsrc"::"git+$_url.git#commit=$_commit"
    'dependencies.txt'
    'mallard-box.png'
    'mallard.png'
  )
  sha256sums=(
    'SKIP'
    '03121c93ac00b3283789a7820c2c90bc8e77781191298d8d67a76237775802c3'
    '2cda88837aa49f849a32d13148048259577e5c788595aa1f8b78dafc1a72c62e'
    '8a2d6c76473b324ef67ebca258d7b169c4f361a4f453056295af9c4f17fcb09f'
  )

  pkgver() {
    echo "${pkgver:?}"
  }
}

_source_backtrace() {
  source+=("ianlancetaylor.libbacktrace"::"git+https://github.com/ianlancetaylor/libbacktrace.git")
  sha256sums+=('SKIP')
}

_source_cpuinfo() {
  _pkgsrc_cpuinfo="pytorch.cpuinfo"
  source+=(
    "$_pkgsrc_cpuinfo"::"git+https://github.com/pytorch/cpuinfo.git"
    "cpuinfo-0001-Fix-building-as-a-shared-library.patch.zst"
  )
  sha256sums+=(
    'SKIP'
    '9263d020f6eb1e473db97b4b3205d794a56ae9c3ea6adf71a803632af98a29a4'
  )
}

_source_discord_rpc() {
  _pkgsrc_discord_rpc="discord-rpc"
  source+=(
    "$_pkgsrc_discord_rpc"::"git+https://github.com/discord/discord-rpc.git"
    "discord-rpc-0001-Reapply-shutdown-patch.patch.zst"
    "discord-rpc-0002-Add-rapidjson-to-avoid-download.patch.zst"
    "discord-rpc-0003-Tidy-up.patch.zst.001"
    "discord-rpc-0003-Tidy-up.patch.zst.002"
    "discord-rpc-0004-CMake-find_package-support.patch.zst"
    "discord-rpc-0005-Default-visibility-to-hidden.patch.zst"
  )
  sha256sums+=(
    'SKIP'
    'b211f546f7fd437502ad3bf8924d339f31ded5c98aa302af9dae0f03a017b903'
    '19f87a2dd2a2dda8bc7015c1718ea2c4be82ef4f9e510ce7a3ee340926960a83'
    '836a558c6201b4e2d3767aeccdb26da45993c3a5541bc83cc906a5148e4ea638'
    '5c860b369b2a886f1f3ed3d790216dd7e2e3c243ecd5bf179de23c7448366276'
    '525202180552883a1952ef92b044678a0681e454d5e03252e746adea369ff305'
    '614525f46189c5c6f40e5870290fafeacc313a49661367537decc27b939957b2'
  )
}

_source_lunasvg() {
  _pkgsrc_lunasvg="sammycage.lunasvg"
  source+=(
    "$_pkgsrc_lunasvg"::"git+https://github.com/sammycage/lunasvg.git"
    "lunasvg_2.4.1_9af1ac7.patch.zst"
  )
  sha256sums+=(
    'SKIP'
    'eeae0e7897ee73a483e5c4955aa37807ff20ea3c226ec29c2b6d06038402c195'
  )
}

_source_shaderc() {
  depends+=(
    'glslang'
    'spirv-tools'
  )
  makedepends+=(
    'spirv-headers'
  )

  _pkgsrc_shaderc="shaderc"
  source+=(
    "$_pkgsrc_shaderc"::"git+https://github.com/google/shaderc.git"
    "shaderc_6d28483_f60bb80.patch.zst.001"
    "shaderc_6d28483_f60bb80.patch.zst.002"
    "shaderc_6d28483_f60bb80.patch.zst.003"
    "shaderc_6d28483_f60bb80.patch.zst.004"
    "shaderc_6d28483_f60bb80.patch.zst.005"
    "shaderc_6d28483_f60bb80.patch.zst.006"
    "shaderc_6d28483_f60bb80.patch.zst.007"
    "shaderc_6d28483_f60bb80.patch.zst.008"
    "shaderc_6d28483_f60bb80.patch.zst.009"
    "shaderc_6d28483_f60bb80.patch.zst.010"
  )
  sha256sums+=(
    'SKIP'
    'ab6dab6f74fa12a5211df5755e4e60cb4830e884870ef4fa20a8ae6031b19029'
    '250ad209454bd83a8a0917083db50655648d80bc249df73503ee4a6e379f4256'
    '7bda4fdb018e41ba3ac744bc9bb7cd4a1d96a937893949de7a26c8982254c943'
    'ff6a101a5be41c0271c83d8b257c719832b5263fc74571034b69c17a8d95a067'
    '56bb787e687e58c66a874d1a21a215d178ca2827be96b666f74909e63bf5b17f'
    '374af0d84d5a77d20be4708e3d1ade5b94ca4382b1f39edca2a5d8fd0902e03a'
    'c0d888c358514701b174442597fb9a1621ae8266abbb81030cc750f6b7a3b18a'
    'b71d4874ba30a8b560f69cca845d8c05e8c1af4b8fe9385de8620b5ed69feba5'
    '5eea083e12442bc400dcd3efa3f1ac8fe1589e9cfa4e77822820fba0654a1222'
    'a15a1ac810631b73723e0738eff991899e60c0f8df782abaf6ef53285c6a2123'
  )
}

_source_soundtouch() {
  _pkgsrc_soundtouch="soundtouch"
  source+=(
    "$_pkgsrc_soundtouch"::"git+https://codeberg.org/soundtouch/soundtouch.git"
    "soundtouch-0001-Local-changes.patch.zst"
    "soundtouch-0002-Slim-down-for-downloads.patch.zst.001"
    "soundtouch-0002-Slim-down-for-downloads.patch.zst.002"
  )
  sha256sums+=(
    'SKIP'
    'cccd155ca6f3db3c343dcf665336f052117ea2fc2815bf085e6098fb211c8fe5'
    '8fb22b6ccb8cde000b32615c8c3e5c8f75e8ed422966aa55ecd013513abb4114'
    'f7f082f47b0ceeb418a5a73cfb5fe2b548c60a98eedbd02d9674e3e1543568dc'
  )
}

_source_spirv_cross() {
  source+=("khronosgroup.spirv-cross"::"git+https://github.com/KhronosGroup/SPIRV-Cross.git")
  sha256sums+=('SKIP')
}

_apply_patches() {
  [ -z "$1" ] && return 1
  for i in "$srcdir/$1"*.patch.zst.001; do
    if [[ -f "$(readlink -f "$i")" && ! -e "${i%.001}" ]]; then
      cat "${i%.001}".[0-9]* > "${i%.001}"
    fi
  done

  for i in "$srcdir/$1"*.patch.zst; do
    if [ -f "$(readlink -f "$i")" ]; then
      echo "Applying patch ${i%.zst}..."
      zstdcat "$i" | git apply --whitespace=nowarn
    fi
  done
}

_prepare_backtrace() (
  local _version_backtrace=$(grep -E -m1 'LIBBACKTRACE=' dependencies.txt | sed -E -e 's&^\s*LIBBACKTRACE=(\S+)$&\1&')
  echo "backtrace = $_version_backtrace"
  git -c advice.detachedHead=false -C "$srcdir/ianlancetaylor.libbacktrace" checkout -f "$_version_backtrace"
  echo
)

_prepare_cpuinfo() (
  local _version_cpuinfo=$(grep -E -m1 'CPUINFO=' dependencies.txt | sed -E -e 's&^\s*CPUINFO=(\S+)$&\1&')
  echo "cpuinfo = $_version_cpuinfo"
  cd "$srcdir/$_pkgsrc_cpuinfo"
  git -c advice.detachedHead=false checkout -f "$_version_cpuinfo"
  _apply_patches cpuinfo
  echo
)

_prepare_discord_rpc() (
  local _version_discord_rpc=$(grep -E -m1 'DISCORD_RPC=' dependencies.txt | sed -E -e 's&^\s*DISCORD_RPC=(\S+)$&\1&')
  echo "discord-rpc = $_version_discord_rpc"
  cd "$srcdir/$_pkgsrc_discord_rpc"
  git -c advice.detachedHead=false checkout -f "$_version_discord_rpc"
  _apply_patches discord-rpc
  echo
)

_prepare_lunasvg() (
  local _version_lunasvg=$(grep -E -m1 'LUNASVG=' dependencies.txt | sed -E -e 's&^\s*LUNASVG=(\S+)$&\1&')
  echo "lunasvg = $_version_lunasvg"
  cd "$srcdir/$_pkgsrc_lunasvg"
  git -c advice.detachedHead=false checkout -f "$_version_lunasvg"
  _apply_patches lunasvg
  echo
)

_prepare_shaderc() (
  local _version_shaderc=$(grep -E -m1 'SHADERC=' dependencies.txt | sed -E -e 's&^\s*SHADERC=(\S+)$&\1&')
  echo "shaderc = $_version_shaderc"
  cd "$srcdir/$_pkgsrc_shaderc"
  git -c advice.detachedHead=false checkout -f "$_version_shaderc"
  _apply_patches shaderc

  sed -E -e '/\(glslc\)/d;/examples/d;/third_party/d' -i CMakeLists.txt
  echo
)

_prepare_soundtouch() (
  local _version_soundtouch=$(grep -E -m1 'SOUNDTOUCH=' dependencies.txt | sed -E -e 's&^\s*SOUNDTOUCH=(\S+)$&\1&')
  echo "soundtouch = $_version_soundtouch"
  cd "$srcdir/$_pkgsrc_soundtouch"
  git -c advice.detachedHead=false checkout -f "$_version_soundtouch"
  _apply_patches soundtouch
  echo
)

_prepare_spirv_cross() (
  local _version_spirv_cross=$(grep -E -m1 'SPIRV_CROSS=' dependencies.txt | sed -E -e 's&^\s*SPIRV_CROSS=(\S+)$&\1&')
  echo "spirv-cross = $_version_spirv_cross"
  cd "$srcdir/khronosgroup.spirv-cross"
  git -c advice.detachedHead=false checkout -f "$_version_spirv_cross"
  echo
)

_prepare_duckstation() {
  local _pkgver=$(pkgver)
  _commit=$(git -C "$_pkgsrc" rev-parse HEAD)

  # disable autoupdate
  sed -E -e 's@#define AUTO_UPDATER_SUPPORTED@@' \
    -e 's@#if !__has_include\("scmversion/tag.h"\) && !defined\(_DEBUG\)@#if 0@' \
    -i "$_pkgsrc/src/duckstation-qt/autoupdaterdialog.cpp"

  sed -E -e '/BindWidgetToBoolSetting/s&^(.*autoUpdateEnabled.*), true&\1, false&' \
    -i "$_pkgsrc/src/duckstation-qt/setupwizarddialog.cpp"

  sed -E -e '/<widget class="QCheckBox" name="autoUpdateEnabled">/a\
      <property name="enabled"><bool>false</bool></property>' \
    -i "$_pkgsrc/src/duckstation-qt/setupwizarddialog.ui"

  # adjust about dialog
  # link to specific commit
  # prevent issue reports to upstream
  sed -E \
    -e 's&^(\s*).*g_scm_tag_str.*g_scm_branch_str.*$&\1tr("%1").arg(QLatin1StringView(g_scm_tag_str)));&' \
    -e 's&, focusing on &.&' \
    -e '/^<p.*(Connor|icons8|%2<\/span>:).*\/p>/d' \
    -e '/tr\("(Authors|Icon by)"\)/d' \
    -e 's&>%4<&>%2<&' \
    -e 's& \| <a href="https://\S*discord\S+">.*?</a>&&' \
    -e 's&"https://github.com/\S+/CONTRIBUTORS.md"&"'"$_url/raw/${_commit}"'/CONTRIBUTORS.md"&' \
    -e 's&"https://github.com/\S+/LICENSE"&"'"$_url/raw/${_commit}"'/LICENSE"&' \
    -e 's&"https://github.com/\S+/duckstation"&"'"$_url/commits/${_commit}"'"&' \
    -i "$_pkgsrc/src/duckstation-qt/aboutdialog.cpp"

  sed -e '/addaction name="actionIssueTracker"/d' -i "$_pkgsrc/src/duckstation-qt/mainwindow.ui"

  cat > "0000-help-menu.patch" << 'END'
--- a/src/duckstation-qt/mainwindow.ui
+++ b/src/duckstation-qt/mainwindow.ui
@@ -126,11 +126,6 @@
     <property name="title">
      <string>&amp;Help</string>
     </property>
-    <addaction name="actionGitHubRepository"/>
-    <addaction name="actionDiscordServer"/>
-    <addaction name="separator"/>
-    <addaction name="actionCheckForUpdates"/>
-    <addaction name="separator"/>
     <addaction name="actionViewThirdPartyNotices"/>
     <addaction name="actionAboutQt"/>
     <addaction name="actionAbout"/>
END

  patch -Np1 -F100 -d "$_pkgsrc" -i "../0000-help-menu.patch"

  # fix header
  cat >> "$_pkgsrc/src/scmversion/tag.h" << EOF
#pragma once
#define SCM_RELEASE_ASSET "$_pkgname"
#define SCM_RELEASE_TAGS {"latest", "preview"}
#define SCM_RELEASE_TAG "latest"
EOF

  # clarify this is GPL version
  sed -E -e 's&(DuckStation) Version&\1 GPL&' \
    -e 's&(DuckStation) (%1)&\1 GPL \2&' \
    -i "$_pkgsrc/src/duckstation-qt/qthost.cpp"

  sed -E -e 's&(DuckStation)&\1 GPL&g' \
    -i "$_pkgsrc/src/core/fullscreen_ui.cpp" \
    "$_pkgsrc/src/duckstation-qt/aboutdialog.cpp" \
    "$_pkgsrc/src/duckstation-qt/aboutdialog.ui" \
    "$_pkgsrc/src/duckstation-qt/mainwindow.ui" \
    "$_pkgsrc/src/duckstation-qt/setupwizarddialog.ui" \
    "$_pkgsrc/src/duckstation-qt/translations"/*.ts

  # add unofficial build notice
  local _notice_unofficial="This is an unofficial build based on the last GPL commit on 2024-09-01."
  local _notice_dnr="Do not report issues to the original developer"

  sed -E -e 's@This wizard.*Interface Settings\.@'"${_notice_unofficial}"'\&lt;/p\&gt;\&lt;p\&gt;'"${_notice_dnr}"'.@' \
    -i "$_pkgsrc/src/duckstation-qt/setupwizarddialog.ui"

  sed -E \
    -e 's&"playability, speed, and long-term maintainability\."&"</p><p>'"${_notice_unofficial}"'"&' \
    -e 's&^(<p[^>]+>)  and other (.*contributors</a>)&\1'"${_notice_dnr}"' or \2.&' \
    -i "$_pkgsrc/src/duckstation-qt/aboutdialog.cpp"

  # change icon
  install -Dm644 mallard-box.png "$_pkgsrc"/src/duckstation-qt/resources/icons/UpdateDuck.png
  install -Dm664 mallard.png "$_pkgsrc"/data/resources/images/duck.png
  install -Dm664 mallard.png "$_pkgsrc"/scripts/org.duckstation.DuckStation.png
  magick mallard.png -resize 64x64 png8:"$_pkgsrc"/src/duckstation-qt/resources/icons/duck_64.png
  magick mallard.png -resize 128x128 png8:"$_pkgsrc"/src/duckstation-qt/resources/icons/duck_128.png
  magick mallard.png -resize 256x256 png8:"$_pkgsrc"/src/duckstation-qt/resources/icons/duck.png

  # fix version script
  install -Dm755 /dev/stdin "$_pkgsrc/src/scmversion/gen_scmversion.sh" << END
#!/bin/sh
HASH="$(git -C "$_pkgsrc" rev-parse HEAD)"
BRANCH="GPL"
TAG="$_pkgver"
DATE=$(git -C "$_pkgsrc" log -1 --date=iso8601-strict --format=%cd)

cat > "scmversion.cpp" << EOF
const char* g_scm_hash_str = "\${HASH}";
const char* g_scm_branch_str = "\${BRANCH}";
const char* g_scm_tag_str = "\${TAG}";
const char* g_scm_date_str = "\${DATE}";

EOF
END
}

_build_backtrace() (
  echo "Building libbacktrace..."
  cd "ianlancetaylor.libbacktrace"

  autoreconf -fi
  ./configure
  make

  install -Dm644 .libs/libbacktrace.a -t "$srcdir/deps/"
  install -Dm644 *.h -t "$srcdir/deps/include/"
)

_build_cpuinfo() {
  echo "Building cpuinfo..."
  local _cmake_cpuinfo=(
    -B build_cpuinfo
    -S "$_pkgsrc_cpuinfo"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCPUINFO_LIBRARY_TYPE=shared
    -DCPUINFO_RUNTIME_TYPE=shared
    -DCPUINFO_LOG_LEVEL=error
    -DCPUINFO_LOG_TO_STDIO=ON
    -DCPUINFO_BUILD_TOOLS=OFF
    -DCPUINFO_BUILD_UNIT_TESTS=OFF
    -DCPUINFO_BUILD_MOCK_TESTS=OFF
    -DCPUINFO_BUILD_BENCHMARKS=OFF
    -DUSE_SYSTEM_LIBS=ON
    -Wno-dev
  )

  cmake "${_cmake_cpuinfo[@]}"
  cmake --build build_cpuinfo
  DESTDIR="$srcdir/deps" cmake --install build_cpuinfo
}

_build_discord_rpc() {
  echo "Building discord-rpc..."
  local _cmake_discord_rpc=(
    -B build_discord_rpc
    -S "$_pkgsrc_discord_rpc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DBUILD_SHARED_LIBS=ON
    -Wno-dev
  )

  cmake "${_cmake_discord_rpc[@]}"
  cmake --build build_discord_rpc
  DESTDIR="$srcdir/deps" cmake --install build_discord_rpc
}

_build_lunasvg() {
  echo "Building lunasvg..."
  local _cmake_lunasvg=(
    -B build_lunasvg
    -S "$_pkgsrc_lunasvg"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DBUILD_SHARED_LIBS=ON
    -Wno-dev
  )

  cmake "${_cmake_lunasvg[@]}"
  cmake --build build_lunasvg
  DESTDIR="$srcdir/deps" cmake --install build_lunasvg
}

_build_shaderc() {
  echo "Building shaderc..."
  local _cmake_shaderc=(
    -B build_shaderc
    -S "$_pkgsrc_shaderc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DSHADERC_SKIP_TESTS=ON
    -DSHADERC_SKIP_EXAMPLES=ON
    -DSHADERC_SKIP_COPYRIGHT_CHECK=ON
    -Dglslang_SOURCE_DIR=/usr/include/glslang
    -Wno-dev
  )

  cmake "${_cmake_shaderc[@]}"
  cmake --build build_shaderc
  DESTDIR="$srcdir/deps" cmake --install build_shaderc
}

_build_soundtouch() {
  echo "Building soundtouch..."

  local _cmake_soundtouch=(
    -B build_soundtouch
    -S "$_pkgsrc_soundtouch"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DBUILD_SHARED_LIBS=ON
    -Wno-dev
  )

  cmake "${_cmake_soundtouch[@]}"
  cmake --build build_soundtouch
  DESTDIR="$srcdir/deps" cmake --install build_soundtouch
}

_build_spirv_cross() {
  echo "Building spirv-cross..."

  local _cmake_spirv_cross=(
    -B build_spirv_cross
    -S "khronosgroup.spirv-cross"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DSPIRV_CROSS_SHARED=ON
    -DSPIRV_CROSS_STATIC=OFF
    -DSPIRV_CROSS_CLI=OFF
    -DSPIRV_CROSS_ENABLE_TESTS=OFF
    -DSPIRV_CROSS_ENABLE_GLSL=ON
    -DSPIRV_CROSS_ENABLE_HLSL=OFF
    -DSPIRV_CROSS_ENABLE_MSL=OFF
    -DSPIRV_CROSS_ENABLE_CPP=OFF
    -DSPIRV_CROSS_ENABLE_REFLECT=OFF
    -DSPIRV_CROSS_ENABLE_C_API=ON
    -DSPIRV_CROSS_ENABLE_UTIL=ON
    -Wno-dev
  )

  cmake "${_cmake_spirv_cross[@]}"
  cmake --build build_spirv_cross
  DESTDIR="$srcdir/deps" cmake --install build_spirv_cross
}

_build_duckstation() {
  echo "Building duckstation..."

  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_SKIP_RPATH=ON
    -DBUILD_NOGUI_FRONTEND=OFF
    -DBUILD_QT_FRONTEND=ON
    -DDiscordRPC_DIR="$srcdir/deps/usr/lib/cmake/DiscordRPC"
    -DLIBBACKTRACE_INCLUDE_DIR="$srcdir/deps/include"
    -DLIBBACKTRACE_LIBRARY="$srcdir/deps/libbacktrace.a"
    -DSHADERC_INCLUDE_DIR="$srcdir/deps/usr/include"
    -DSHADERC_LIBRARY="$srcdir/deps/usr/lib/libshaderc_shared.so"
    -DShaderc_DIR="$srcdir/deps/usr/lib/cmake/Shaderc"
    -DSoundTouch_DIR="$srcdir/deps/usr/lib/cmake/SoundTouch"
    -Dcpuinfo_DIR="$srcdir/deps/usr/share/cpuinfo"
    -Dlunasvg_DIR="$srcdir/deps/usr/lib/cmake/lunasvg"
    -Dspirv_cross_c_shared_DIR="$srcdir/deps/usr/share/spirv_cross_c_shared/cmake"
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

prepare() {
  _prepare_backtrace
  _prepare_cpuinfo
  _prepare_discord_rpc
  _prepare_lunasvg
  _prepare_shaderc
  _prepare_soundtouch
  _prepare_spirv_cross

  _prepare_duckstation
}

build() {
  export PATH="/usr/lib/llvm${_clang_ver}/bin:$PATH"

  export CC CXX LDFLAGS
  CC="clang"
  CXX="clang++"

  local _ldflags=(${LDFLAGS})
  LDFLAGS+="${_ldflags[@]//*use-ld*/} -fuse-ld=lld"

  export CMAKE_POLICY_VERSION_MINIMUM=3.5

  _build_backtrace
  _build_cpuinfo
  _build_discord_rpc
  _build_lunasvg
  _build_shaderc
  _build_soundtouch
  _build_spirv_cross

  _build_duckstation
}

package_duckstation-gpl() {
  # add conflicts after meta package is retired
  provides=("$_pkgname")

  # rpath
  patchelf --force-rpath --set-rpath '$ORIGIN' "build/bin/$_pkgname-qt"
  patchelf --force-rpath --set-rpath '$ORIGIN' "deps/usr/lib"/*.so

  # main files
  install -dm755 "$pkgdir/opt/$_pkgname/"
  cp -r build/bin/{resources,translations,duckstation-qt} "$pkgdir/opt/$_pkgname/"

  # libraries
  install -Dm644 "deps/usr/lib"/*.so* -t "$pkgdir/opt/$_pkgname/"

  if [ -f "$pkgdir/opt/$_pkgname/libshaderc_ds.so" ]; then
    ln -sf libshaderc_ds.so "$pkgdir/opt/$_pkgname/libshaderc_shared.so"
  elif [ -f "$pkgdir/opt/$_pkgname/libshaderc_shared.so" ]; then
    ln -sf libshaderc_shared.so "$pkgdir/opt/$_pkgname/libshaderc_ds.so"
  else
    echo "warning: shaderc library not found."
  fi

  # icon
  install -Dm644 "$pkgdir/opt/$_pkgname/resources/images/duck.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"

  # script
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" << END
#!/usr/bin/env sh
exec /opt/$_pkgname/$_pkgname-qt "\$@"
END

  # launcher
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
[Desktop Entry]
Type=Application
Name=DuckStation
GenericName=PlayStation Emulator
Comment=PlayStation emulator
Icon=$_pkgname
TryExec=$_pkgname
Exec=$_pkgname %f
Terminal=false
StartupNotify=true
Categories=Game;Emulator;Qt;
END

  # permissions
  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}

package_duckstation() {
  pkgdesc="metapackage - migrate to duckstation-gpl"
  url="https://aur.archlinux.org/pkgbase/duckstation"
  license=('None')
  arch=('any')

  depends=('duckstation-gpl')
}

_source_duckstation
_source_backtrace
_source_cpuinfo
_source_discord_rpc
_source_lunasvg
_source_shaderc
_source_soundtouch
_source_spirv_cross
