# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=o
pkgver=2.32.5
pkgrel=1
pkgdesc='Small, fast and VT100-compatible text editor'
arch=(x86_64)
url='https://github.com/xyproto/o'
license=(BSD)
fmakedepends=(git go)
source=("git+$url#commit=774b7be49e02f1142b314b878717109597b00daa") # tag: 2.32.5
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
            'google-java-format: for formatting Java'
            'fpc: for compiling Object Pascal'
            'lua-format: for formatting Lua'
            'lua: for compiling Lua')

build() {
  cd $pkgname

  # Using gccgo and upx gives a smaller size
  #go build -buildmode=pie -gccgoflags="-s -w $LDFLAGS" && upx o
  go build -buildmode=pie -gcflags="all=-trimpath=$PWD" -asmflags "all=-trimpath=$PWD" -ldflags "-s -w -extldflags $LDFLAGS"
}

package() {
  install -Dm755 $pkgname/$pkgname "$pkgdir/usr/bin/$pkgname"
  ln -sf '/usr/bin/o' "$pkgdir/usr/bin/red"
  install -Dm644 $pkgname/$pkgname.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
  install -Dm644 $pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
