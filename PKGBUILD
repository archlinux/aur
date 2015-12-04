# Maintainer: Theo Tosini <theo.tosini@theoduino.me>
pkgname=swift-language-git
pkgver=swift.2.2.SNAPSHOT.2015.12.01.b.r232.g273ad25
pkgrel=1
pkgdesc="The Swift programming language, taken directly from the Apple repository"
arch=('x86_64')
url="https://swift.org/"
license=('apache2')
groups=()
depends=()
makedepends=('git' 'ninja')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/apple/swift'
        'llvm::git+https://github.com/apple/swift-llvm'
        'clang::git+https://github.com/apple/swift-clang'
        'lldb::git+https://github.com/apple/swift-lldb'
        'cmark::git+https://github.com/apple/swift-cmark'
        'llbuild::git+https://github.com/apple/swift-llbuild'
        'swiftpm::git+https://github.com/apple/swift-package-manager'
        'git+https://github.com/apple/swift-corelibs-xctest'
        'git+https://github.com/apple/swift-corelibs-foundation')
noextract=()
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

pkgver() {
    cd "$pkgname/swift"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/swift"
    # Patch to use python2
    find . -type f -print0 | xargs -0 sed -i 's/\/usr\/bin\/env python/\/usr\/bin\/env python2/g'
    # Release build
    python2 utils/build-script -R
}

package() {
  cd "$srcdir/build"
  cp -R Ninja-ReleaseAssert $pkgdir/opt/swift
}

# vim:set ts=2 sw=2 et:
