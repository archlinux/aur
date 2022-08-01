# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=o
pkgver=2.55.1
pkgrel=1
pkgdesc='Text editor and minimalistic IDE'
arch=(x86_64)
url='https://github.com/xyproto/o'
license=(BSD)
depends=(vte3)
makedepends=(git go)
source=("git+$url#commit=ee2e08538c47b67e941d2e7c5d6d63a984d72fe3") # tag: v2.55.1
optdepends=('asciidoctor: for writing man pages'
            'agda: for compiling Agda'
            'astyle: for formatting C#'
            'autopep8: for formatting Python'
            'brittany: for formatting Haskell'
            'clang: for formatting C++ code with clang-format'
            'clojure: for compiling Clojure'
            'crystal: for compiling Crystal'
            'cxx: for compiling C and C++'
            'elm: for compiling Elm'
            'fpc: for compiling Object Pascal'
            'fstabfmt: for formatting /etc/fstab'
            'gdb: for debugging C'
            'gdc: for compiling D'
            'ghc: for compiling Haskell'
            'google-java-format: for formatting Java'
            'guessica: for updating PKGBUILD files'
            'hare: for compiling Hare'
            'jad: for decompiling .class files on the fly'
            'java-environment: for compiling Java'
            'kotlin: for compiling Kotlin'
            'ktlint: for formatting Kotlin'
            'lua: for compiling Lua'
            'lua-format: for formatting Lua'
            'mlton: for compiling Standard ML'
            'mono: for compiling C#'
            'nasm: for compiling Assembly'
            'ocaml: for compiling and formatting OCaml'
            'odin: for compiling Odin'
            'perl-tidy: for formatting Perl'
            'pandoc-bin: for exporting Markdown to PDF'
            'prettier: for formatting JavaScript, TypeScript and CSS'
            'rustup: for compiling and formatting Rust'
            'scala: for compiling Scala'
            'scdoc: for writing man pages'
            'shfmt: for formattig Shell scripts'
            'tidy: for formatting HTML'
            'v: for compiling and formatting V'
            'yasm: for compiling Assembly'
            'zig: for compiling and formatting Zig')
b2sums=('SKIP')

build() {
  cd $pkgname/v2
  go build -buildmode=pie -ldflags="-s -w -extldflags \"${LDFLAGS}\"" \
    -mod=vendor -trimpath -o ../o -v
  cd ..
  make gui
}

package() {
  cd $pkgname
  install -Dm755 o "$pkgdir/usr/bin/o"
  ln -sf /usr/bin/o "$pkgdir/usr/bin/edit"
  ln -sf /usr/bin/o "$pkgdir/usr/bin/feedgame"
  ln -sf /usr/bin/o "$pkgdir/usr/bin/lighted"
  ln -sf /usr/bin/o "$pkgdir/usr/bin/redblack"
  install -Dm644 $pkgname.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  DESTDIR="$pkgdir" make gui-install
  ln -sf /usr/bin/ko "$pkgdir/usr/bin/lo"
}
