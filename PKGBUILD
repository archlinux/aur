# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
_projectname='seq'
pkgname="ocaml-$_projectname"
pkgver='base'
_commit='cbb37092ecf7d4b3a5ff43a69aacbed19a4668e5'
pkgrel='8'
pkgdesc='Dummy backward-compatibility package for iterators'
arch=('x86_64' 'i486' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://github.com/ocaml/opam-repository/tree/master/packages/$_projectname/$_projectname.$pkgver"
license=('custom:CC0')
depends=('ocaml>=4.07.0')
makedepends=('ocaml-findlib' 'opam')
options=('!strip')
source=(
	"$pkgname-$pkgver-$pkgrel-opam::https://raw.githubusercontent.com/ocaml/opam-repository/$_commit/packages/$_projectname/$_projectname.$pkgver/opam"
	"$pkgname-$pkgver-$pkgrel-META.seq::https://raw.githubusercontent.com/ocaml/opam-repository/$_commit/packages/$_projectname/$_projectname.$pkgver/files/META.seq"
	"$pkgname-$pkgver-$pkgrel-seq.install::https://raw.githubusercontent.com/ocaml/opam-repository/$_commit/packages/$_projectname/$_projectname.$pkgver/files/seq.install"
	"$pkgname-$pkgver-$pkgrel-COPYING::https://raw.githubusercontent.com/ocaml/opam-repository/$_commit/COPYING"
)
sha512sums=('3c233e2b8015ba229ccdd1906e47b2ffa793e22d4f4466011b7da4a6ec68d8f40cd6d9397aebde053722b2ea466c21d2dcb8dfcaf648c3d194b0009ce9a657a8'
            '1ad76cc25bf663d5d35e5ea9057bff11e7882d8ddc4367b6e38a761df0aa7a8fe76de2fe3b7080a575572dad26556261a05f6044906d7874df89e0157e35e623'
            '915b9de54aa9e0489876094ed83690c653c0436b4e0ef502ab28aa1133d10f3b30baa190306629ccc94b5bfa837bff4426ed32e627cfad8954d32e0d8536a6e0'
            'c14f8508ab81ed48588e1de314fd20e54eb0c08bdaaf4c50c2301a6ee2705d45e2d18db863a0f7a1cbb5e5ed11dbb9490378b3e64fb384b16f212c3f0e3d3c81')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/"
	mkdir -p "$srcdir/$_sourcedirectory/files/"
	mv "$pkgname-$pkgver-$pkgrel-opam" "$srcdir/$_sourcedirectory/opam"
	mv "$pkgname-$pkgver-$pkgrel-COPYING" "$srcdir/$_sourcedirectory/COPYING"
	mv "$pkgname-$pkgver-$pkgrel-META.seq" "$srcdir/$_sourcedirectory/files/META.seq"
	mv "$pkgname-$pkgver-$pkgrel-seq.install" "$srcdir/$_sourcedirectory/files/seq.install"
}

package() {
	cd "$srcdir/$_sourcedirectory/files/"
	opam-installer --libdir="$pkgdir$(ocamlfind -printconf destdir)"
	install -Dm644 '../COPYING' "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
