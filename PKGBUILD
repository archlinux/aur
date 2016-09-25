# Contributor: Isak Karlsson <isak.karlsson@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgbase=rust-nightly
pkgname=rust-nightly
pkgver=1.13.0_2016.09.25
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='A safe, concurrent, practical language'
url='http://www.rust-lang.org/'
license=('MIT' 'Apache')
depends=('shared-mime-info')
makedepends=('libffi' 'perl' 'python2' 'curl' 'llvm' 'clang' 'haskell-pandoc' 'emacs')
source=("http://static.rust-lang.org/dist/rustc-nightly-src.tar.gz")
sha256sums=('SKIP')
options=('!makeflags' 'staticlibs' '!strip' '!emptydirs')
conflicts=('rust')
provides=('rust')

build() {
  cd rustc-nightly
  ./configure --prefix=/usr --disable-rpath --enable-compiler-docs
  make
 }

package_rust-nightly() {
	depends=('shared-mime-info')
	optdepends=('rust-doc-git: language and API documentation')
	provides=('rust')
	conflicts=('rust')
	options=('staticlibs')
	cd rustc-nightly

	make DESTDIR="$pkgdir" install

	rm -f "$pkgdir"/usr/lib/rustlib/{components,manifest-rustc,manifest-rust-docs,rust-installer-version,install.log,uninstall.sh}

	install --directory "$pkgdir"/usr/share/licenses/rust-nightly/
	install -m644 COPYRIGHT LICENSE-* "$pkgdir"/usr/share/licenses/rust-nightly
	install --directory "$pkgdir"/usr/share/licenses/rust-nightly-doc/
	install -m644 COPYRIGHT LICENSE-* "$pkgdir"/usr/share/licenses/rust-nightly-doc
}


