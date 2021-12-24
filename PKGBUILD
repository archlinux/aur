# Maintainer: algebro <algebro at tuta dot io>

pkgname=pcsx-redux-git
_pkgname=pcsx-redux
pkgver=r2659.24046fc2
pkgrel=1
pkgdesc='Modern fork of the pcsxr PlayStation 1 emulator focused on reverse engineering and homebrew development'
arch=('x86_64')
url='https://github.com/grumpycoders/pcsx-redux.git'
license=('GPL2')
depends=('ffmpeg'
         'glfw'
         'libuv'
         'freetype2'
         'sdl2'
         'zlib'
         )
options=('!buildflags')
makedepends=('git'
             'make'
             'pkg-config'
            )
source=("${_pkgname}::git+https://github.com/grumpycoders/pcsx-redux.git"
        'git+https://github.com/ocornut/imgui.git'
        'git+https://github.com/ocornut/imgui_club.git'
        'git+https://github.com/mateidavid/zstr.git'
        'git+https://github.com/grumpycoders/uC-sdk.git'
        'git+https://github.com/google/googletest.git'
        'git+https://github.com/fmtlib/fmt.git'
        'git+https://github.com/nodejs/http-parser.git'
        'git+https://github.com/serge1/ELFIO.git'
        'git+https://github.com/exoticlibraries/libcester.git'
        'git+https://github.com/grumpycoders/LuaJIT.git'
        'git+https://github.com/luvit/luv.git'
        'git+https://github.com/keplerproject/lua-compat-5.3.git'
        'git+https://github.com/nothings/stb.git'
        'git+https://github.com/wolfpld/tracy.git'
        'git+https://github.com/Neargye/magic_enum.git'
        'git+https://github.com/Distrotech/ucl.git'
        'git+https://github.com/gabomdq/SDL_GameControllerDB'
        'git+https://github.com/herumi/xbyak'
        'git+https://github.com/grumpycoders/zep'
        'git+https://github.com/mackron/miniaudio.git'
        'git+https://github.com/capstone-engine/capstone.git'
        'pcsx-redux.sh'
        )
sha256sums=('SKIP'
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
            '21db8ce528f3240388d55d1f309ebc6060bb1145cce50553659e73fb6f89d326')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" | sed 's/^v//;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  git submodule init
  git config submodule.third_party/imgui.url "$srcdir/imgui"
  git config submodule.third_party/imgui_club.url "$srcdir/imgui_club"
  git config submodule.third_party/zstr.url "$srcdir/zstr"
  git config submodule.third_party/uC-sdk.url "$srcdir/uC-sdk"
  git config submodule.third_party/googletest.url "$srcdir/googletest"
  git config submodule.third_party/fmt.url "$srcdir/fmt"
  git config submodule.third_party/http-parser.url "$srcdir/http-parser"
  git config submodule.third_party/ELFIO.url "$srcdir/ELFIO"
  git config submodule.third_party/libcester.url "$srcdir/libcester"
  git config submodule.third_party/luajit.url "$srcdir/LuaJIT"
  git config submodule.third_party/luv.url "$srcdir/luv"
  git config submodule.third_party/stb.url "$srcdir/stb"
  git config submodule.third_party/tracy.url "$srcdir/tracy"
  git config submodule.third_party/magic_enum.url "$srcdir/magic_enum"
  git config submodule.third_party/ucl.url "$srcdir/ucl"
  git config submodule.third_party/SDL_GameControllerDB.url "$srcdir/SDL_GameControllerDB"
  git config submodule.third_party/xbyak.url "$srcdir/xbyak"
  git config submodule.third_party/zep.url "$srcdir/zep"
  git config submodule.third_party/miniaudio.url "$srcdir/miniaudio"
  git config submodule.third_party/capstone.url "$srcdir/capstone"

  git submodule update third_party/imgui \
                       third_party/imgui_club \
                       third_party/zstr \
                       third_party/uC-sdk \
                       third_party/googletest \
                       third_party/fmt \
                       third_party/http-parser \
                       third_party/ELFIO \
                       third_party/libcester \
                       third_party/luajit \
                       third_party/luv \
                       third_party/stb \
                       third_party/tracy \
                       third_party/magic_enum \
                       third_party/ucl \
                       third_party/SDL_GameControllerDB \
                       third_party/xbyak \
                       third_party/zep \
                       third_party/miniaudio \
                       third_party/capstone

  cd third_party/luv
  git submodule init
  git config submodule.deps/lua-compat-5.3.url "$srcdir/lua-compat-5.3"

  git submodule update deps/lua-compat-5.3
}

build() {
  cd "$_pkgname"
  make
}

package() {
  install -Dm755 pcsx-redux.sh "$pkgdir/usr/bin/pcsx-redux"
  install -Dm644 "$_pkgname/resources/pcsx-redux.desktop" "$pkgdir/usr/share/applications/pcsx-redux.desktop"
  install -Dm644 "$_pkgname/resources/pcsx-redux.ico" "$pkgdir/opt/pcsx-redux/pcsx-redux.ico"
  install -Dm644 "$_pkgname/i18n/el.po" "$pkgdir/opt/pcsx-redux/el.po"
  install -Dm644 "$_pkgname/i18n/fr.po" "$pkgdir/opt/pcsx-redux/fr.po"
  install -Dm644 "$_pkgname/i18n/pcsx-redux.pot" "$pkgdir/opt/pcsx-redux/pcsx-redux.pot"
  install -Dm644 "$_pkgname/third_party/noto/NotoMono-Regular.ttf" "$pkgdir/opt/pcsx-redux/fonts/NotoMono-Regular.ttf"
  install -Dm644 "$_pkgname/third_party/noto/NotoSans-Regular.ttf" "$pkgdir/opt/pcsx-redux/fonts/NotoSans-Regular.ttf"
  install -Dm755 "$_pkgname/pcsx-redux" "$pkgdir/opt/pcsx-redux/pcsx-redux"
}
