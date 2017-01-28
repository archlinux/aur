# Contributor: Isak Karlsson <isak.karlsson@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=rust-nightly
pkgver=1.16.0_2017.01.28
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='A safe, concurrent, practical language'
url='http://www.rust-lang.org/'
license=('MIT' 'Apache')
makedepends=('libffi' 'perl' 'python2' 'curl')
source=("http://static.rust-lang.org/dist/rustc-nightly-src.tar.gz")
md5sums=('6e17e94b177378570b2c0623d14c579f')
options=('!makeflags' 'staticlibs' '!strip' '!emptydirs')
conflicts=('rust')
provides=('rust')

build() {
  cd rustc-nightly-src
   ./configure --prefix=/usr --disable-rpath --disable-compiler-docs --disable-rustbuild
  make
 }

package_rust-nightly() {
	depends=('shared-mime-info')
	optdepends=('rust-doc-git: language and API documentation')
	provides=('rust')
	conflicts=('rust')
	cd rustc-nightly-src

	make DESTDIR="$pkgdir" install
	rm -fr "$pkgdir"/usr/share/doc/rust/html

	rm -f "$pkgdir"/usr/lib/rustlib/{components,manifest-rustc,manifest-rust-docs,rust-installer-version,install.log,uninstall.sh}

	install --directory "$pkgdir"/usr/share/licenses/rust-nightly/
	install -m644 COPYRIGHT LICENSE-* "$pkgdir"/usr/share/licenses/rust-nightly
}


