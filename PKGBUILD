# Maintainer: algebro <algebro at tuta dot io>
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>

pkgname=pcsx-redux-git
_pkgname=pcsx-redux
pkgver=r6813.b745534e
pkgrel=2
pkgdesc='Modern fork of the pcsxr PlayStation 1 emulator focused on reverse engineering and homebrew development'
arch=('x86_64' 'aarch64')
url='https://github.com/grumpycoders/pcsx-redux.git'
license=('GPL2')
options=('!lto')
provides=(pcsx-redux)
conflicts=(pcsx-redux)
depends=('ffmpeg'
         'fmt'
         'glfw'
         'libuv'
         'freetype2'
         'sdl2'
         'zlib'
         'capstone'
         'curl'
         )
makedepends=('git'
             'make'
             'pkg-config'
             'imagemagick'
            )
source=("${_pkgname}::git+https://github.com/grumpycoders/pcsx-redux.git"
        'git+https://github.com/ocornut/imgui.git'
        'git+https://github.com/grumpycoders/uC-sdk.git'
        'git+https://github.com/google/googletest.git'
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
        'git+https://github.com/TartanLlama/expected.git'
        'git+https://github.com/grumpycoders/vixl.git'
        'git+https://github.com/mity/md4c.git'
        'git+https://github.com/mekhontsev/imgui_md.git'
        'git+https://github.com/iafonov/multipart-parser-c.git'
        'git+https://github.com/grumpycoders/nanovg.git'
        'git+https://github.com/grumpycoders/nanosvg.git'
        'git+https://github.com/lunarmodules/luafilesystem.git'
        'git+https://github.com/grumpycoders/luacov.git'
        'git+https://github.com/bluebird75/luaunit.git'
        'git+https://github.com/uriparser/uriparser.git'
        'git+https://github.com/taocpp/PEGTL.git'
        'git+https://github.com/grumpycoders/psxlua.git'
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
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" | sed 's/^v//;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  git submodule init
  git config submodule.third_party/imgui.url "$srcdir/imgui"
  git config submodule.third_party/uC-sdk.url "$srcdir/uC-sdk"
  git config submodule.third_party/googletest.url "$srcdir/googletest"
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
  git config submodule.third_party/expected.url "$srcdir/expected"
  git config submodule.third_party/vixl.url "$srcdir/vixl"
  git config submodule.third_party/md4c.url "$srcdir/md4c"
  git config submodule.third_party/imgui_md.url "$srcdir/imgui_md"
  git config submodule.third_party/multipart-parser-c.url "$srcdir/multipart-parser-c"
  git config submodule.third_party/nanovg.url "$srcdir/nanovg"
  git config submodule.third_party/nanosvg.url "$srcdir/nanosvg"
  git config submodule.third_party/luafilesystem.url "$srcdir/luafilesystem"
  git config submodule.third_party/luacov.url "$srcdir/luacov"
  git config submodule.third_party/luaunit.url "$srcdir/luaunit"
  git config submodule.third_party/uriparser.url "$srcdir/uriparser"
  git config submodule.third_party/PEGTL.url "$srcdir/PEGTL"
  git config submodule.third_party/psxlua.url "$srcdir/psxlua"

  git -c protocol.file.allow=always submodule update third_party/imgui \
                       third_party/uC-sdk \
                       third_party/googletest \
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
                       third_party/expected \
                       third_party/vixl \
                       third_party/md4c \
                       third_party/imgui_md \
                       third_party/multipart-parser-c \
                       third_party/nanovg \
                       third_party/nanosvg \
                       third_party/luafilesystem \
                       third_party/luacov \
                       third_party/luaunit \
                       third_party/uriparser \
                       third_party/PEGTL \
                       third_party/psxlua

  cd third_party/luv
  git submodule init
  git config submodule.deps/lua-compat-5.3.url "$srcdir/lua-compat-5.3"
  git -c protocol.file.allow=always submodule update deps/lua-compat-5.3
  sed -i 's/convert/magick convert/g' "$srcdir/$_pkgname/Makefile"
}

build() {
  cd "$_pkgname"
  make
}

package() {
    cd "$srcdir/$_pkgname"
    install -dm755 "$pkgdir/usr"
    make DESTDIR="$pkgdir/usr" install
}
