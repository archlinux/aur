# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=orbiton
pkgver=2.61.0
pkgrel=1
pkgdesc='Text editor and minimalistic IDE'
arch=(x86_64)
url='https://github.com/xyproto/orbiton'
license=(BSD)
makedepends=(git go vte3)
conflicts=(o)
replaces=(o)
provides=(o)
source=("git+$url#commit=81afb48057e2e6c7dabc175c1aacb11c6402829b") # tag: v2.61.0
optdepends=('asciidoctor: for writing man pages'
            'agda: for compiling Agda'
            'astyle: for formatting C#'
            'autopep8: for formatting Python'
            'brittany: for formatting Haskell'
            'clang: for formatting C++ code with clang-format'
            'clojure: for compiling Clojure'
            'crystal: for compiling Crystal'
            'cxx: for compiling C and C++'
            'elm-bin: for compiling Elm'
            'fpc: for compiling Object Pascal'
            'fstabfmt: for formatting /etc/fstab'
            'gdb: for debugging C'
            'gdc: for compiling D'
            'ghc: for compiling Haskell'
            'godot: for using GDScript'
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
            'vlang: for compiling and formatting V'
            'vte3: for the ko GUI frontend'
            'yasm: for compiling Assembly'
            'zig: for compiling and formatting Zig')
b2sums=('SKIP')

build() {
  cd $pkgname/v2
  go build -buildmode=pie -ldflags="-s -w -extldflags \"${LDFLAGS}\"" \
    -mod=vendor -trimpath -o ../o -v
  make -C .. gui
}

package() {
  cd $pkgname
  install -Dm755 o "$pkgdir/usr/bin/o"
  install -Dm644 o.1 "$pkgdir/usr/share/man/man1/o.1"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # VTK UI
  DESTDIR="$pkgdir" make gui-install

  # Recommended symlinks for Orbiton
  ln -sf /usr/bin/o "$pkgdir/usr/bin/li"
  ln -sf /usr/bin/o "$pkgdir/usr/bin/redblack"
  ln -sf /usr/bin/o "$pkgdir/usr/bin/sw"
  ln -sf /usr/bin/o "$pkgdir/usr/bin/edi"
  ln -sf /usr/bin/o "$pkgdir/usr/bin/vs"
  ln -sf /usr/bin/o "$pkgdir/usr/bin/feedgame"

  # Recommended symlinks for the GUI version of Orbiton
  ln -sf /usr/bin/og "$pkgdir/usr/bin/lig"
  ln -sf /usr/bin/og "$pkgdir/usr/bin/redblackg"
  ln -sf /usr/bin/og "$pkgdir/usr/bin/swg"
  ln -sf /usr/bin/og "$pkgdir/usr/bin/edig"
  ln -sf /usr/bin/og "$pkgdir/usr/bin/vsg"
}
