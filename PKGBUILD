# Maintainer: algebro <algebro at tuta dot io>

pkgname=pcsx-redux-git
_pkgname=pcsx-redux
pkgver=r1542.110c5bf
pkgrel=1
pkgdesc='Modern fork of the pcsxr PlayStation 1 emulator focused on reverse engineering and homebrew development'
arch=('x86_64')
url='https://github.com/grumpycoders/pcsx-redux.git'
license=('GPL2')
depends=('ffmpeg'
         'glfw-x11'
         'libuv'
         'sdl2'
         'zlib'
         )
makedepends=('clang'
             'git'
             'make'
             'pkg-config'
            )
source=("${_pkgname}::git+https://github.com/grumpycoders/pcsx-redux.git"
        'pcsx-redux.sh'
        'pcsx-redux.desktop'
        )
sha256sums=('SKIP'
            '21db8ce528f3240388d55d1f309ebc6060bb1145cce50553659e73fb6f89d326'
            '9061d4428ba69e06e3a540df6700a637cc28e740f95b07ca46f2cbcc8cdd347c')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" | sed 's/^v//;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  git submodule update --init --recursive
}

build() {
  cd "$_pkgname"
  CC=/usr/bin/clang CXX=/usr/bin/clang++ make
}

package() {
  install -Dm755 pcsx-redux.sh "$pkgdir/usr/bin/pcsx-redux"
  install -Dm644 pcsx-redux.desktop "$pkgdir/usr/share/applications/pcsx-redux.desktop"
  install -Dm755 "$_pkgname/pcsx-redux" "$pkgdir/opt/pcsx-redux/pcsx-redux"
}
