# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=o
pkgver=2.34.1
pkgrel=1
pkgdesc='Small, fast and VT100-compatible text editor'
arch=(x86_64)
url='https://github.com/xyproto/o'
license=(BSD)
makedepends=(git go)
source=("git+$url#commit=07370880aa7df4f1883553a5e6482df930e0eab2") # tag: 2.34.1
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
            'lua: for compiling Lua'
            'tidy: for formatting HTML')
sha256sums=('SKIP')

build() {
  cd $pkgname
  go build -v -mod=vendor -trimpath -buildmode=pie -ldflags="-s -w -extldflags \"${LDFLAGS}\""
}

package() {
  install -Dm755 $pkgname/$pkgname "$pkgdir/usr/bin/$pkgname"
  ln -sf '/usr/bin/o' "$pkgdir/usr/bin/red"
  ln -sf '/usr/bin/o' "$pkgdir/usr/bin/light"
  install -Dm644 $pkgname/$pkgname.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
  install -Dm644 $pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
