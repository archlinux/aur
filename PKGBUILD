# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=zynaddsubfx-git
pkgver=3.0.6.r59.g255d8442
pkgrel=1
pkgdesc="A powerful realtime, multi-timbral software synthesizer."
arch=('i686' 'x86_64')
url="http://zynaddsubfx.sourceforge.net"
license=('GPL2')
depends=('fftw' 'hicolor-icon-theme' 'jack' 'libglvnd' 'liblo' 'libuv' 'mxml' 'portaudio' 'sndio' 'ttf-roboto')
makedepends=('git' 'alsa-lib' 'asciidoc' 'asciidoctor' 'cmake' 'cxxtest' 'doxygen' 'dssi' 'fltk' 'ladspa' 'libxpm' 'ntk' 'ruby-rake')
optdepends=('dssi: dssi plugin'
            'lv2-host: for using the LV2 plug-in'
            'vst-host: for using the VST plug-in')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
options=('!emptydirs')
source=("${pkgname%-*}::git+https://github.com/zynaddsubfx/zynaddsubfx"
        "instruments::git+https://github.com/zynaddsubfx/instruments"
        "DPF::git+https://github.com/DISTRHO/DPF"
        "pugl::git+https://github.com/DISTRHO/pugl"
        "rtosc::git+https://github.com/fundamental/rtosc"
        "nanovg::git+https://github.com/memononen/nanovg"
        "mruby-zest-build::git+https://github.com/mruby-zest/mruby-zest-build"
        "mruby::git+https://github.com/mruby/mruby"
        "mruby-sleep::git+https://github.com/matsumoto-r/mruby-sleep"
        "mruby-dir-glob::git+https://github.com/gromnitsky/mruby-dir-glob"
        "mruby-regexp-pcre::git+https://github.com/iij/mruby-regexp-pcre"
        "mruby-set::git+https://github.com/yui-knk/mruby-set"
        "mruby-io::git+https://github.com/iij/mruby-io"
        "mruby-glew::git+https://github.com/IceDragon200/mruby-glew"
        "mruby-glfw3::git+https://github.com/IceDragon200/mruby-glfw3"
        "mruby-nanovg::git+https://github.com/mruby-zest/mruby-nanovg"
        "mruby-qml-spawn::git+https://github.com/mruby-zest/mruby-qml-spawn"
        "mruby-qml-parse::git+https://github.com/mruby-zest/mruby-qml-parse"
        "mruby-complex::git+https://github.com/pbosetti/mruby-complex"
        "mruby-dir::git+https://github.com/iij/mruby-dir"
        "mruby-errno::git+https://github.com/iij/mruby-errno"
        "mruby-file-stat::git+https://github.com/ksss/mruby-file-stat"
        "mruby-process::git+https://github.com/iij/mruby-process"
        "mruby-zest_rtosc::git+https://github.com/fundamental/rtosc"
        "http://zynaddsubfx.sourceforge.net/doc/instruments/unsortedzynaddsubfxParameters_20140402.zip"
        "${pkgname%-*}-libzest_location.patch"
        "${pkgname%-*}-mruby-zest-build-libzest_location.patch"
        "${pkgname%-*}-mruby-zest-build-system_wide_location.patch")
noextract=("${source[24]##*/}")
sha512sums=('SKIP'
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
            '13e7ed9746d0ce7959afa067211175cd007fdeb77500756dd5b0a57e6230e425934a7fe267a5197b539c3305c497745beb2fef2f5e79e4c8662a9c57cf2345f0'
            '695f5776b07e4ace611f358ea1007e0023f1ba6dcf4ebb85974b461490850c51bb85903abafc07b23236051ab161cc0e538a127a11efd0b1dfd129dc99f37d77'
            'd7ef0b4e8068d1d09d34c913d7b70342eaaa2eb8dae619d223e3e03ac667cf76c6e5615b60efabaf7eae594e3a5d6f40bc0cf10b8e939da1aa349bc27dff4ea8'
            '2a6b57df3a9ffac669341d37739b281ce32696f82d82ee17220fdc9e426729d40f91cf50e1b58b7be1cc9bc5651d99794ae5e1bbd32f25c14aaf489989e10aab')

prepare() {
  cd $srcdir/${pkgname%-*}
  [ -d build ] || mkdir build
  git submodule update --init --recursive --no-fetch
  git config submodule.DPF.url "$srcdir/DPF"
  git config submodule.dgl/src/pugl-upstream.url "$srcdir/pugl"
  git config submodule.instruments.url "$srcdir/instruments"
  git config submodule.rtosc.url "$srcdir/rtosc"
  git -c protocol.file.allow=always submodule update --recursive

  cd $srcdir/mruby-zest-build
  git submodule init
  git submodule deinit deps/libuv
  git config submodule.deps/nanovg.url "$srcdir/nanovg"
  git config submodule.deps/rtosc.url "$srcdir/mruby-zest_rtosc"
  git config submodule.mruby.url "$srcdir/mruby"
  git config submodule.deps/mruby-sleep.url "$srcdir/mruby-sleep"
  git config submodule.deps/mruby-dir-glob.url "$srcdir/mruby-dir-glob"
  git config submodule.deps/mruby-regexp-pcre.url "$srcdir/mruby-regexp-pcre"
  git config submodule.deps/mruby-set.url "$srcdir/mruby-set"
  git config submodule.deps/mruby-io.url "$srcdir/mruby-io"
  git config submodule.deps/mruby-glew.url "$srcdir/mruby-glew"
  git config submodule.deps/mruby-glfw3.url "$srcdir/mruby-glfw3"
  git config submodule.deps/mruby-nanovg.url "$srcdir/mruby-nanovg"
  git config submodule.deps/mruby-qml-spawn.url "$srcdir/mruby-qml-spawn"
  git config submodule.deps/mruby-qml-parse.url "$srcdir/mruby-qml-parse"
  git config submodule.deps/mruby-complex.url "$srcdir/mruby-complex"
  git config submodule.deps/mruby-dir.url "$srcdir/mruby-dir"
  git config submodule.deps/mruby-errno.url "$srcdir/mruby-errno"
  git config submodule.deps/mruby-file-stat.url "$srcdir/mruby-file-stat"
  git config submodule.deps/mruby-process.url "$srcdir/mruby-process"
  git -c protocol.file.allow=always submodule update

  # load libzest.so from custom system location in /usr/lib/zynaddsubfx/
  patch -Np1 -d $srcdir/${pkgname%-*} -i ../${pkgname%-*}-libzest_location.patch
  # load libzest.so from custom system location in /usr/lib/zynaddsubfx/
  patch -Np1 -i ../${pkgname%-*}-mruby-zest-build-libzest_location.patch
  # load qml data from custom system location in /usr/share/zynaddsubfx/qml/
  # load JSON schema from custom system location in /usr/share/zynaddsubfx/schema/
  # load fonts from custom system location in /usr/share/fonts/TTF/
  patch -Np1 -i ../${pkgname%-*}-mruby-zest-build-system_wide_location.patch
}

pkgver() {
  cd ${pkgname%-*}
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd ${pkgname%-*}/build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
           -DCMAKE_INSTALL_LIBDIR=/usr/lib \
           -DGuiModule=zest 
  make
  make -C "$srcdir/mruby-zest-build"
  make man -C "$srcdir/${pkgname%-*}/doc"

  # External programs
  make -C "$srcdir/${pkgname%-*}/ExternalPrograms/Spliter"
  make -C "$srcdir/${pkgname%-*}/ExternalPrograms/Controller"
}

check() {
  make -k test ARGS='-VVd' -C "${pkgname%-*}/build"
}

package() {
  cd ${pkgname%-*}/build
  make DESTDIR="$pkgdir" install
  install -vDm 644 ../${pkgname%-*}.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
  install -vDm 644 ../doc/${pkgname%-*}.1 -t "$pkgdir/usr/share/man/man1/"

  # External programs and documentation.
  install -Dm755 "../ExternalPrograms/Spliter/spliter" \
                 "$pkgdir/usr/bin/spliter"
  install -Dm644 "../ExternalPrograms/Spliter/readme.txt" \
                 "$pkgdir/usr/share/doc/${pkgname%-*}/SPLITER.txt"
  install -Dm755 "../ExternalPrograms/Controller/controller" \
                 "$pkgdir/usr/bin/controller"

  cd $srcdir/mruby-zest-build
  install -vDm 755 zest "$pkgdir/usr/bin/zyn-fusion"
  install -vDm 755 libzest.so -t "$pkgdir/usr/lib/${pkgname%-*}/"
  install -vDm 644 src/mruby-zest/{example,qml}/*.qml -t "$pkgdir/usr/share/${pkgname%-*}/qml/"
  install -vDm 644 src/osc-bridge/schema/test.json -t "$pkgdir/usr/share/${pkgname%-*}/schema/"
  install -vDm 644 completions/zyn-fusion -t "$pkgdir/usr/share/bash-completion/completions/"

  # Additional parameters
  install -d "${pkgdir}/usr/share/${pkgname%-*}/parameters"
  bsdtar --strip-components 1 --uid 0 --gid 0 -zxf \
                 ${srcdir}/${source[24]##*/} -C \
                 "${pkgdir}/usr/share/${pkgname%-*}/parameters"
}
