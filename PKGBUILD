# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=o
pkgver=2.36.0
pkgrel=1
pkgdesc='Quick little editor limited by VT100'
arch=(x86_64)
url='https://github.com/xyproto/o'
license=(BSD)
makedepends=(git go)
source=("git+$url#commit=113fa49898e6e476ba12bb88840b02418447914f") # tag: 2.36.0
optdepends=('cxx: for compiling C++'
            'brittany: for formatting Haskell'
            'clang: for formatting C++ code with clang-format'
            'rustup: for compiling and formatting Rust'
            'zig: for compiling and formatting Zig'
            'v: for compiling and formatting V'
            'ghc: for compiling Haskell'
            'ocaml: for compiling and formatting OCaml'
            'odin: for compiling Odin'
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
            'tidy: for formatting HTML'
            'scala: for compiling Scala'
            'fstabfmt: for formatting /etc/fstab')
b2sums=('SKIP')

build() {
  cd $pkgname
  go build -v -mod=vendor -trimpath -buildmode=pie -ldflags="-s -w -extldflags \"${LDFLAGS}\""
}

package() {
  cd $pkgname
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  ln -sf /usr/bin/o "$pkgdir/usr/bin/light"
  ln -sf /usr/bin/o "$pkgdir/usr/bin/red"
  install -Dm644 $pkgname.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
