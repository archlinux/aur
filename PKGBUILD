# Maintainer: Michael Hansen <zrax0111 gmail com>
# Maintainer: soloturn@gmail.com
# Maintainer: fanjiang <prof.fan@foxmail.com>
# Contributor: Theo Tosini <theo.tosini@theoduino.me>
# Contributor: Gábor Sebestyén <segabor@gmail.com>
# Contributor: Andrew Sun <adsun701@gmail.com>

_pkgname="swift-language"
pkgname="$_pkgname"
_swiftver=swift-5.9.2-RELEASE
pkgver=5.9.2
pkgrel=1
pkgdesc="The Swift programming language and debugger"
arch=('x86_64')
#url="https://swift.org/"
url="https://github.com/apple/swift"
license=('apache2')
depends=('icu' 'libedit' 'libxml2' 'python' 'libbsd' 'ncurses')
makedepends=(
  'clang' 'cmake' 'git' 'lld' 'llvm' 'ninja'
  'patch' 'python-six' 'rsync' 'swift-language' 'swig'
)

# utils/update_checkout/update-checkout-config.json
source=(
  "git+https://github.com/apple/swift#tag=${_swiftver}"
  '0001-arch-aur-patches.patch'

  "apple-llvm-project"::"git+https://github.com/apple/llvm-project#tag=${_swiftver}"
  "swift-argument-parser"::"git+https://github.com/apple/swift-argument-parser#tag=1.2.2"
  "swift-cmark"::"git+https://github.com/apple/swift-cmark#tag=${_swiftver}"
  "swift-corelibs-foundation"::"git+https://github.com/apple/swift-corelibs-foundation#tag=${_swiftver}"
  "swift-corelibs-libdispatch"::"git+https://github.com/apple/swift-corelibs-libdispatch#tag=${_swiftver}"
  "swift-corelibs-xctest"::"git+https://github.com/apple/swift-corelibs-xctest#tag=${_swiftver}"
  "swift-driver"::"git+https://github.com/apple/swift-driver#tag=${_swiftver}"
  "swift-integration-tests"::"git+https://github.com/apple/swift-integration-tests#tag=${_swiftver}"
  "swift-llbuild"::"git+https://github.com/apple/swift-llbuild#tag=${_swiftver}"
  "swift-package-manager"::"git+https://github.com/apple/swift-package-manager#tag=${_swiftver}"
  "swift-stress-tester"::"git+https://github.com/apple/swift-stress-tester#tag=${_swiftver}"
  "swift-syntax"::"git+https://github.com/apple/swift-syntax#tag=${_swiftver}"
  "swift-tools-support-core"::"git+https://github.com/apple/swift-tools-support-core#tag=${_swiftver}"

  # swift src to check afterwards
  "apple-indexstore-db"::"git+https://github.com/apple/indexstore-db#tag=${_swiftver}"
  "apple-sourcekit-lsp"::"git+https://github.com/apple/sourcekit-lsp#tag=${_swiftver}"
  "swift-asn1"::"git+https://github.com/apple/swift-asn1#tag=0.7.0"
  "swift-atomics"::"git+https://github.com/apple/swift-atomics#tag=1.0.2"
  "swift-certificates"::"git+https://github.com/apple/swift-certificates#tag=0.4.1"
  "swift-cmark-gfm"::"git+https://github.com/apple/swift-cmark#tag=${_swiftver}"
  "swift-collections"::"git+https://github.com/apple/swift-collections#tag=1.0.1"
  "swift-crypto"::"git+https://github.com/apple/swift-crypto#tag=2.5.0"
  "swift-docc"::"git+https://github.com/apple/swift-docc#tag=${_swiftver}"
  "swift-docc-render-artifact"::"git+https://github.com/apple/swift-docc-render-artifact#tag=${_swiftver}"
  "swift-docc-symbolkit"::"git+https://github.com/apple/swift-docc-symbolkit#tag=${_swiftver}"
  "swift-format"::"git+https://github.com/apple/swift-format#tag=${_swiftver}"
  "swift-installer-scripts"::"git+https://github.com/apple/swift-installer-scripts#tag=${_swiftver}"
  "swift-lmdb"::"git+https://github.com/apple/swift-lmdb#tag=${_swiftver}"
  "swift-markdown"::"git+https://github.com/apple/swift-markdown#tag=${_swiftver}"
  "swift-nio"::"git+https://github.com/apple/swift-nio#tag=2.31.2"
  "swift-nio-ssl"::"git+https://github.com/apple/swift-nio-ssl#tag=2.15.0"
  "swift-numerics"::"git+https://github.com/apple/swift-numerics#tag=1.0.1"
  "swift-system"::"git+https://github.com/apple/swift-system#tag=1.1.1"
  "swift-tools-support-core"::"git+https://github.com/apple/swift-tools-support-core#tag=${_swiftver}"
  "swift-xcode-playground-support"::"git+https://github.com/apple/swift-xcode-playground-support#tag=${_swiftver}"
  "yams"::"git+https://github.com/jpsim/Yams#tag=5.0.1"
)
sha256sums=(
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
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)


# By default makepkg runs strip on binaries. This causes issues with the Swift REPL.
# from https://github.com/RLovelett/swift-aur/blob/master/PKGBUILD
# termux had no trouble up to now, strip all executables and shared objects:
# https://github.com/termux/termux-packages/blob/master/scripts/build/termux_step_massage.sh#L24
# would be cool to not strip only the ones which really are necessary, but how?
options=(!strip)

prepare () {
  ln -sfP 'apple-indexstore-db' 'indexstore-db'
  ln -sfP 'apple-llvm-project' 'llvm-project'
  ln -sfP 'apple-sourcekit-lsp' 'sourcekit-lsp'
  ln -sfP 'swift-argument-parser' 'argument-parser'
  ln -sfP 'swift-asn1' 'asn1'
  ln -sfP 'swift-atomics' 'atomics'
  ln -sfP 'swift-certificates' 'certificates'
  ln -sfP 'swift-cmark' 'cmark'
  ln -sfP 'swift-cmark' 'cmark'
  ln -sfP 'swift-collections' 'collections'
  ln -sfP 'swift-corelibs-foundation' 'corelibs-foundation'
  ln -sfP 'swift-corelibs-libdispatch' 'corelibs-libdispatch'
  ln -sfP 'swift-corelibs-xctest' 'corelibs-xctest'
  ln -sfP 'swift-crypto' 'crypto'
  ln -sfP 'swift-docc' 'docc'
  ln -sfP 'swift-docc-render-artifact' 'docc-render-artifact'
  ln -sfP 'swift-docc-symbolkit' 'docc-symbolkit'
  ln -sfP 'swift-driver' 'driver'
  ln -sfP 'swift-experimental-string-processing' 'experimental-string-processing'
  ln -sfP 'swift-format' 'format'
  ln -sfP 'swift-installer-scripts' 'installer-scripts'
  ln -sfP 'swift-integration-tests' 'integration-tests'
  ln -sfP 'swift-llbuild' 'llbuild'
  ln -sfP 'swift-llvm-bindings' 'llvm-bindings'
  ln -sfP 'swift-lmdb' 'lmdb'
  ln -sfP 'swift-markdown' 'markdown'
  ln -sfP 'swift-nio' 'nio'
  ln -sfP 'swift-nio-ssl' 'nio-ssl'
  ln -sfP 'swift-numerics' 'numerics'
  ln -sfP 'swift-package-manager' 'package-manager'
  ln -sfP 'swift-stress-tester' 'stress-tester'
  ln -sfP 'swift-syntax' 'syntax'
  ln -sfP 'swift-system' 'system'
  ln -sfP 'swift-tools-support-core' 'tools-support-core'
  ln -sfP 'swift-xcode-playground-support' 'xcode-playground-support'

  ( cd swift && patch -Np1 -F100 -i "${srcdir:?}/0001-arch-aur-patches.patch" )
}

build() {
  # Fix /usr/include error
  find "$srcdir/swift/stdlib/public/SwiftShims" -type f -print0 | xargs -0 sed -i 's|/usr/include/x86_64-linux-gnu|/usr/include|g'
  find "$srcdir/llvm-project/clang" -type f -print0 | xargs -0 sed -i 's|/usr/include/x86_64-linux-gnu|/usr/include|g'
  find "$srcdir/llvm-project/clang-tools-extra" -type f -print0 | xargs -0 sed -i 's|/usr/include/x86_64-linux-gnu|/usr/include|g'

  local _build_options_test=(
    --dry-run
    --preset=buildbot_linux,no_test
    install_destdir="destdir"
  )

  local _build_options=(
    --release
    --skip-early-swift-driver
    --skip-early-swiftsyntax
  )

  "$srcdir/swift/utils/build-script" "${_build_options[@]}"
}

package() {
  DESTDIR="$pkgdir" cmake \
    --install "$srcdir/build/Ninja-ReleaseAssert/cmark-linux-x86_64" \
    --prefix "/usr/lib/swift"

  DESTDIR="$pkgdir" cmake \
    --install "$srcdir/build/Ninja-ReleaseAssert/llvm-linux-x86_64" \
    --prefix "/usr/lib/swift"

  DESTDIR="$pkgdir" cmake \
    --install "$srcdir/build/Ninja-ReleaseAssert/swift-linux-x86_64" \
    --prefix "/usr/lib/swift"
}

# vim:set ts=2 sw=2 et:
