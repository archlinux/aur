# Maintainer: algebro <algebro at tuta dot io>

pkgname=pcsx-redux-git
_pkgname=pcsx-redux
pkgver=r1270.109d9f9
pkgrel=1
pkgdesc='Modern fork of the pcsxr Playstation 1 emulator that focuses on reverse engineering and homebrew development'
arch=('x86_64')
url='https://github.com/grumpycoders/pcsx-redux.git'
license=('GPL2')
depends=('curl'
         'ffmpeg'
         'glfw-x11'
         'libuv'
         'sdl2'
         'xorg-server-xvfb'
         'zlib'
         )
makedepends=('clang'
             'git'
             'make'
             'pkg-config'
            )
source=("${_pkgname}::git+https://github.com/grumpycoders/pcsx-redux.git"
        'git+https://github.com/madler/zlib.git'
        'git+https://github.com/SDL-mirror/SDL.git'
        'git+https://github.com/ocornut/imgui.git'
        'git+https://github.com/ocornut/imgui_club.git'
        'git+https://github.com/grumpycoders/ImGuiColorTextEdit.git'
        'git+https://github.com/libuv/libuv.git'
        'git+https://github.com/mateidavid/zstr.git'
        'git+https://github.com/grumpycoders/uC-sdk.git'
        'git+https://github.com/google/googletest.git'
        'git+https://github.com/fmtlib/fmt.git'
        'git+https://github.com/skypjack/uvw.git'
        'git+https://github.com/nodejs/http-parser.git'
        'git+https://github.com/serge1/ELFIO.git'
        'git+https://github.com/exoticlibraries/libcester.git'
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
            'f6680bd999fe0e409376b552c18ee76428f64a0441e700f5ea8235d661d2b3af')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" | sed 's/^v//;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  git submodule init
  git config submodule.third_party/zlib.url "$srcdir/zlib"
  git config submodule.third_party/SDL.url "$srcdir/SDL"
  git config submodule.third_party/imgui.url "$srcdir/imgui"
  git config submodule.third_party/imgui_club.url "$srcdir/imgui_club"
  git config submodule.third_party/ImGuiColorTextEdit.url "$srcdir/ImGuiColorTextEdit"
  git config submodule.third_party/libuv.url "$srcdir/libuv"
  git config submodule.third_party/zstr.url "$srcdir/zstr"
  git config submodule.third_party/uC-sdk.url "$srcdir/uC-sdk"
  git config submodule.third_party/googletest.url "$srcdir/googletest"
  git config submodule.third_party/fmt.url "$srcdir/fmt"
  git config submodule.third_party/uvw.url "$srcdir/uvw"
  git config submodule.third_party/http-parser.url "$srcdir/http-parser"
  git config submodule.third_party/ELFIO.url "$srcdir/ELFIO"
  git config submodule.third_party/libcester.url "$srcdir/libcester"

  git submodule update third_party/zlib third_party/SDL third_party/imgui third_party/imgui_club \
  third_party/ImGuiColorTextEdit third_party/libuv third_party/zstr third_party/uC-sdk \
  third_party/googletest third_party/fmt third_party/uvw third_party/http-parser third_party/ELFIO \
  third_party/libcester
}

build() {
  cd "$_pkgname"
  CC=/usr/bin/clang CXX=/usr/bin/clang++ make
}

package() {
  install -Dm755 pcsx-redux.sh "$pkgdir/usr/bin/pcsx-redux"
  install -Dm755 "$_pkgname/pcsx-redux" "$pkgdir/usr/share/pcsx-redux/pcsx-redux"
}
