# Maintainer: Ersei <contact at ersei dot net>
# Contributer: Paul <paul@mrarm.io>

pkgname=mcpelauncher-linux-git
pkgver=1.2.0.r0.gfe07760
pkgrel=1
pkgdesc="Minecraft: Pocket Edition launcher for Linux"
# Upstream support arm32 and arm64 but we don't provide packages for those architectures
arch=('x86_64' 'i686')
url="https://github.com/minecraft-linux/mcpelauncher-manifest"
license=('GPL-3.0-only' 'custom')
makedepends_x86_64=('git' 'cmake' 'clang' 'make')
depends_x86_64=('curl' 'libx11' 'zlib' 'libpng' 'libevdev' 'systemd' 'libxi' 'libegl' 'qt6-base' 'qt6-declarative' 'qt6-webengine' 'libuv')
optdepends=('mcpelauncher-ui: GUI for Launcher')
provides=('mcpelauncher-client' 'mcpelauncher-linux')
conflicts=('mcpelauncher-client' 'mcpelauncher-linux')

source=(
  'git+https://github.com/minecraft-linux/mcpelauncher-manifest.git#branch=qt6'
  'git+https://github.com/minecraft-linux/android-support-headers'
  'git+https://github.com/minecraft-linux/arg-parser'
  'git+https://github.com/minecraft-linux/base64'
  'git+https://github.com/minecraft-linux/cll-telemetry'
  'git+https://github.com/minecraft-linux/daemon-utils'
  'git+https://github.com/minecraft-linux/eglut'
  'git+https://github.com/minecraft-linux/epoll-shim'
  'git+https://github.com/minecraft-linux/file-picker'
  'git+https://github.com/minecraft-linux/file-util'
  'git+https://github.com/minecraft-linux/game-window'
  'git+https://github.com/minecraft-linux/libc-shim'
  'git+https://github.com/ChristopherHX/libjnivm'
  'git+https://github.com/MCMrARM/linux-gamepad'
  'git+https://github.com/minecraft-linux/logger'
  'git+https://github.com/minecraft-linux/mcpelauncher-client'
  'git+https://github.com/minecraft-linux/mcpelauncher-common'
  'git+https://github.com/minecraft-linux/mcpelauncher-core'
  'git+https://github.com/minecraft-linux/mcpelauncher-errorwindow'
  'git+https://github.com/minecraft-linux/mcpelauncher-linker'
  'git+https://github.com/minecraft-linux/mcpelauncher-linux-bin'
  'git+https://github.com/minecraft-linux/mcpelauncher-mac-bin'
  'git+https://github.com/minecraft-linux/mcpelauncher-webview'
  'git+https://github.com/minecraft-linux/minecraft-imported-symbols'
  'git+https://github.com/minecraft-linux/msa-daemon-client'
  'git+https://github.com/minecraft-linux/osx-elf-header'
  'git+https://github.com/minecraft-linux/properties-parser'
  'git+https://github.com/MCMrARM/simple-ipc'
  'git+https://github.com/minecraft-linux/android_bionic'
  'git+https://github.com/libsdl-org/SDL'
  'git+https://github.com/ocornut/imgui'
  # Temporary override of 'git+https://android.googlesource.com/platform/system/core'
  # git clone --mirror timed out on archlinux while it still works on ubuntu 22.04, the history has been truncated due to large files
  'git+https://github.com/minecraft-linux/android_core'
)

md5sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

pkgver() {
  git -C mcpelauncher-manifest describe --long --tags | sed 's/^v//;s/.qt6//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  # TODO avoid hardcoding which submodule is supported for archlinux
  git -C mcpelauncher-manifest submodule init
  git -C mcpelauncher-manifest config submodule.android-support-headers.url "$srcdir/android-support-headers"
  git -C mcpelauncher-manifest config submodule.arg-parser.url "$srcdir/arg-parser"
  git -C mcpelauncher-manifest config submodule.base64.url "$srcdir/base64"
  git -C mcpelauncher-manifest config submodule.cll-telemetry.url "$srcdir/cll-telemetry"
  git -C mcpelauncher-manifest config submodule.daemon-utils.url "$srcdir/daemon-utils"
  git -C mcpelauncher-manifest config submodule.eglut.url "$srcdir/eglut"
  git -C mcpelauncher-manifest config submodule.epoll-shim.url "$srcdir/epoll-shim"
  git -C mcpelauncher-manifest config submodule.file-picker.url "$srcdir/file-picker"
  git -C mcpelauncher-manifest config submodule.file-util.url "$srcdir/file-util"
  git -C mcpelauncher-manifest config submodule.game-window.url "$srcdir/game-window"
  git -C mcpelauncher-manifest config submodule.libc-shim.url "$srcdir/libc-shim"
  git -C mcpelauncher-manifest config submodule.libjnivm.url "$srcdir/libjnivm"
  git -C mcpelauncher-manifest config submodule.linux-gamepad.url "$srcdir/linux-gamepad"
  git -C mcpelauncher-manifest config submodule.logger.url "$srcdir/logger"
  git -C mcpelauncher-manifest config submodule.mcpelauncher-client.url "$srcdir/mcpelauncher-client"
  git -C mcpelauncher-manifest config submodule.mcpelauncher-common.url "$srcdir/mcpelauncher-common"
  git -C mcpelauncher-manifest config submodule.mcpelauncher-core.url "$srcdir/mcpelauncher-core"
  git -C mcpelauncher-manifest config submodule.mcpelauncher-errorwindow.url "$srcdir/mcpelauncher-errorwindow"
  git -C mcpelauncher-manifest config submodule.mcpelauncher-linker.url "$srcdir/mcpelauncher-linker"
  git -C mcpelauncher-manifest config submodule.mcpelauncher-linux-bin.url "$srcdir/mcpelauncher-linux-bin"
  git -C mcpelauncher-manifest config submodule.mcpelauncher-mac-bin.url "$srcdir/mcpelauncher-mac-bin"
  git -C mcpelauncher-manifest config submodule.mcpelauncher-webview.url "$srcdir/mcpelauncher-webview"
  git -C mcpelauncher-manifest config submodule.minecraft-imported-symbols.url "$srcdir/minecraft-imported-symbols"
  git -C mcpelauncher-manifest config submodule.msa-daemon-client.url "$srcdir/msa-daemon-client"
  git -C mcpelauncher-manifest config submodule.osx-elf-header.url "$srcdir/osx-elf-header"
  git -C mcpelauncher-manifest config submodule.properties-parser.url "$srcdir/properties-parser"
  git -C mcpelauncher-manifest config submodule.simple-ipc.url "$srcdir/simple-ipc"
  git -C mcpelauncher-manifest config submodule.sdl3.url "$srcdir/SDL"
  git -C mcpelauncher-manifest config submodule.imgui.url "$srcdir/imgui"
  git -C mcpelauncher-manifest -c protocol.file.allow=always submodule update
  git -C mcpelauncher-manifest/mcpelauncher-linker config submodule.bionic.url "$srcdir/android_bionic"
  # Workaround of git clone --mirror timeout commit sha of core doesn't match git repo
  #git -C mcpelauncher-manifest/mcpelauncher-linker config submodule.core.url "$srcdir/core"
  #git -C mcpelauncher-manifest/mcpelauncher-linker -c protocol.file.allow=always submodule update
  git -C mcpelauncher-manifest/mcpelauncher-linker config submodule.core.url "$srcdir/android_core"
  git -C mcpelauncher-manifest/mcpelauncher-linker -c protocol.file.allow=always submodule init
  git -C mcpelauncher-manifest/mcpelauncher-linker -c protocol.file.allow=always submodule update bionic
  GIT_DIR="$PWD/mcpelauncher-manifest/mcpelauncher-linker/core/.git" git -C mcpelauncher-manifest/mcpelauncher-linker/core -c protocol.file.allow=always fetch "$srcdir/android_core" HEAD && git -C mcpelauncher-manifest/mcpelauncher-linker/core checkout FETCH_HEAD || git -c protocol.file.allow=always clone "$srcdir/android_core" mcpelauncher-manifest/mcpelauncher-linker/core
}

build() {
  # Disable FORTIFY_SOURCE=3 because it causes build failures
  # https://github.com/minecraft-linux/libc-shim/issues/33
  # We use Bash to replace the contents of the variable because makepkg sets CFLAGS and we don't want to override them otherwise
  # Those distribution specific CFLAGS and CXXFLAGS are not tested by the minecraft-linux project
  export CFLAGS="${CXXFLAGS//-Wp,-D_FORTIFY_SOURCE=3/}"
  export CXXFLAGS="${CXXFLAGS//-Wp,-D_FORTIFY_SOURCE=3/}"
  # TODO switch to -DCMAKE_POLICY_VERSION_MINIMUM=4.0 once external project references has been updated in qt6 branches
  # -DCMAKE_POLICY_VERSION_MINIMUM=3.5 minecraft-linux has too many old cmake minimum requirements without explicit 4.0 support
  # We use clang because some parts of the codebase require it and android source code no longer supports gcc
  cmake -S mcpelauncher-manifest \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DCMAKE_C_COMPILER=clang \
    -DCMAKE_CXX_COMPILER=clang++ \
    -B build -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DENABLE_DEV_PATHS=OFF \
    -Wno-dev
  cmake --build build --parallel
}

package() {
  libdir="$pkgdir/usr/share/mcpelauncher/lib"
  make -C build DESTDIR="$pkgdir" install
  if [[ $CARCH == "i686" ]]; then
    mv "$pkgdir/usr/bin/mcpelauncher-client" "$pkgdir/usr/bin/mcpelauncher-client32"
	  rm -rf "$libdir/native/x86_64" "$libdir/x86_64" "$libdir/armeabi-v7a" "$libdir/arm64-v8a"
  fi

  if [[ $CARCH == "x86_64" ]]; then
    rm -rf "$libdir/native/x86" "$libdir/x86" "$libdir/armeabi-v7a" "$libdir/arm64-v8a"
  fi

  install -Dm644 mcpelauncher-manifest/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 mcpelauncher-manifest/msa-daemon-client/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.MIT"
  install -Dm644 mcpelauncher-manifest/mcpelauncher-linux-bin/FMod\ License.txt "$pkgdir/usr/share/licenses/$pkgname/fmod_license.txt"
  install -Dm644 mcpelauncher-manifest/eglut/LICENSE "$pkgdir/usr/share/licenses/$pkgname/eglut_license.txt"
}
