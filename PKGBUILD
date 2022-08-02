pkgname=mitogen
pkgver=0.3.3
pkgrel=1
pkgdesc="Distributed self-replicating programs in Python"
license=("BSD")
url="https://mitogen.networkgenomics.com/"
depends=('python')
makedepends=('python-setuptools')
optdepends=('ansible: for using the ansible strategy plugin')
source=("https://github.com/mitogen-hq/mitogen/archive/v${pkgver//_/-}.tar.gz"
	"https://patch-diff.githubusercontent.com/raw/mitogen-hq/mitogen/pull/933.patch"
	"https://patch-diff.githubusercontent.com/raw/mitogen-hq/mitogen/pull/936.patch"
	"stdlib-module-names.patch")
arch=('any')

prepare() {
  cd "$srcdir/$pkgname-${pkgver//_/-}"
  patch -p1 < "../936.patch"
  patch -p1 < "../933.patch"
  patch -p1 < "../stdlib-module-names.patch"
}

build() {
  cd "$srcdir/$pkgname-${pkgver//_/-}"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-${pkgver//_/-}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

md5sums=('0b15434520c5064784984336b6464f87'
         '0845e4d09fea671a295d35047ba54157'
         'e1b8089902d31fa34b79660612209424'
         '24ed5be1ef7e1ccb4bde2e3d1c33577b')
sha1sums=('5fd4c0d68fbaaac9a53188a25d215d8fd1cbaa2a'
          '32bcf5f2b393d48915a4a4847c43a92fac521a3a'
          '067cf243d8d7c052aa7186ecf4b4613d61f81680'
          'c992afc2f9b97c024d8dac0390af69139c1a3553')
sha256sums=('41d2c540a64ca4706f9413e6807c8d5d401918788ae7428d8273c80bb61ca216'
            '31a75c6163cde25dea51dc377d9ed9354d99dbb655af8f5c9894835fba539762'
            'fe20cfc55a61bc84d76cd2f759d3755c732bf8c847db3b4046194601fc06bc8e'
            '6bace589a752827c866d6799b228b0e44c0ec42bb6f19f2ff8fe73ea20d4124c')
sha384sums=('6fa77d0ee3b7b00fa4185fc5936183fc08de2f27aa93c5dd9a6a98d3db79c99939d1f258f4974ddc3514fe190d4ff23d'
            '390bc3edf8b26110e4db841cf5b162bd09641d5a52f197d850f693a46e4432ebe6dc79f3ddebb9f2a9f081e7aee453bf'
            '302c2e9536e45f034f2a59b6eb9ea3cc244780ef1de730a7ae610f91c1441e6889b0823e54e336fea563f6936152b55b'
            'df0705220bbf9549e5a890e581aaefacb33d789c07992d9d0ec002b4f5901c34126443ce043b2779ab910a83aa40eeaa')
sha512sums=('ca9287296090259c796982c02e6b4752b0671d24cc297b46b4235a2e273cf972ebf09fd4806600775f0974e3a097f128ecf3fd476bb04a688e5d118d4bbe5a05'
            '1abb1b1fd7b161dbb55980fe864c8cf68986b5a47ea18f0436b0f4cb86782cf741275a82dbbd71c822e2079765c71716abbb08569aef3f9a926b316298c9ab8a'
            'a73914fd2d06e5b67131c9ecc8187f9d478636a4983f7877c9ac631c9463c8f830e2e9a58c017ca70627e8ce9cf49a4098cdd4a40d5fccdd31f5f6e8e89001a6'
            '51288bbcdce2f943d3c2d4e6e270ef62d0fafc47ac1c46ad777cda25250f5ac5bc7df7430cf8d1c1353c38a5f3170cea29c34336ee16729a9c0df5891252920a')
