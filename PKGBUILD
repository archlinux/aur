# Maintainer: Juan Manuel Méndez Rey (vejeta) <juan.mendezr@proton.me>
# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Upstream: https://codeberg.org/mendezr/xwpe
# Upstream: https://git.metalpunks.info/arch-ports
#
# vim: ts=2 sw=2

pkgname=xwpe
pkgver=1.6.9
pkgrel=2
pkgdesc='Borland Turbo C/Pascal-style programming editor and IDE for console and X11, with LSP and DAP clients'
arch=('i686' 'x86_64')
url='https://codeberg.org/mendezr/xwpe'
license=('GPL-2.0-only')
depends=('glibc'
         'zlib'
         'ncurses'
         'gpm'
         'libvterm'
         'json-c'
         'freetype2'
         'fontconfig'
         'glib2'
         'libx11'
         'libxft'
         'libxkbcommon'
         'wayland'
         'cairo'
         'pango'
         'hicolor-icon-theme')
makedepends=('texinfo')
optdepends=(
  'gcc: C/C++ compiling (F9) and gdb debugging'
  'gdb: source-level debugging; also Rust via DAP'
  'clang: clangd language server for C/C++'
  'python-lsp-server: Python language server'
  'gopls: Go language server'
  'rust-analyzer: Rust language server'
  'delve: Go debugging via DAP'
  'go: Go compiler'
  'rust: Rust compiler'
  'jdk-openjdk: Java compiling (javac) and jdb debugging'
  'python: Python interpreter and pdb debugging'
)
provides=('wpe' 'wpe-common')
conflicts=('wpe' 'wpe-common')
replaces=('wpe' 'wpe-common')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('14499a7a4f5193bf23f539285adf7156054c5bfe6b20b991e705e3c3a5f6b392')

build() {
  cd "${pkgname}-${pkgver}"
  CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}" ./configure \
   --prefix=/usr \
   --mandir=/usr/share/man
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make install DESTDIR="${pkgdir}"
  rm -f "$pkgdir/usr/share/info/dir"
  install -Dvm644 AUTHORS CHANGELOG README.md \
    -t "$pkgdir/usr/share/doc/$pkgname"
}
