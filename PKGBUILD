# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=o
pkgver=2.30.3
pkgrel=2
pkgdesc='Small, fast and VT100-compatible text editor'
arch=(x86_64)
url='https://github.com/xyproto/o'
license=(BSD)
fmakedepends=(git go)
source=("git+$url#commit=638c7174f7ab9b03a4bc667a5910c2795fd03444") # tag: 2.30.3
sha256sums=('SKIP')
options=(!strip)
optdepends=('cxx: for compiling C++'
            'brittany: for formatting Haskell'
            'clang: for formatting C++ code with clang-format'
            'rustup: for compiling and formatting Rust'
            'zig: for compiling and formatting Zig'
            'v: for compiling and formatting V'
            'ghc: for compiling Haskell'
            'ocaml: for compiling and formatting OCaml'
            'autopep8: for formatting Python'
            'scdoc: for writing man pages'
            'asciidoctor: for writing man pages'
            'pandoc: for exporting Markdown to PDF'
            'guessica: for updating PKGBUILD files'
            'kotlin: for compiling Kotlin'
            'crystal: for compiling Crystal'
            'java-environment: for compiling Java'
            'google-java-format: for formatting Java')

build() {
  cd $pkgname

  # Using gccgo and upx gives a smaller size
  #go build -buildmode=pie -gccgoflags="-s -w $LDFLAGS" && upx o
  go build -buildmode=pie -gcflags="all=-trimpath=$PWD" -asmflags "all=-trimpath=$PWD" -ldflags "-s -w -extldflags $LDFLAGS"
}

package() {
  install -Dm755 $pkgname/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname/$pkgname.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
  install -Dm644 $pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
