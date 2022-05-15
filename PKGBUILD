pkgname=mitogen
pkgver=0.3.2
pkgrel=3
pkgdesc="Distributed self-replicating programs in Python"
license=("BSD")
url="https://mitogen.networkgenomics.com/"
depends=('python')
makedepends=('python-setuptools')
optdepends=('ansible: for using the ansible strategy plugin')
source=("https://github.com/mitogen-hq/mitogen/archive/v${pkgver//_/-}.tar.gz"
	"pr913-pt1.patch::https://github.com/mitogen-hq/mitogen/commit/0fa0a93f556387a4989d3ac41bd9945a17c4b9fc.patch"
	"pr913-pt2.patch::https://github.com/mitogen-hq/mitogen/commit/47699e15aa0f6eea5ce558a67e2fea644d4ea913.patch"
	"pr913-pt3.patch::https://github.com/mitogen-hq/mitogen/commit/d2ca8a94239958394363c9faab70c5db99a82cae.patch")
arch=('any')

prepare() {
  cd "$srcdir/$pkgname-${pkgver//_/-}"
  patch -p1 < "$srcdir/pr913-pt1.patch"
  patch -p1 < "$srcdir/pr913-pt2.patch"
  patch -p1 < "$srcdir/pr913-pt3.patch"
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

md5sums=('aa55d6974d62506d4c5d5df9743f70f1'
         'bc1d112b1cecc3cf5c58226078859ac2'
         'fca5fd4db06eeaf1fb24c8413c840194'
         '22ddaa45b5aa6e4f5dba78615a7a7ab9')
sha1sums=('f2d0d4c1a3756cbed14fb72130b8a05837d0c158'
          'a9eccbf5d826842e872e3baa87d66730067e0ec8'
          '24c5cceb445ee5adece1c9e6ed0e5032852fa825'
          '8a8391d194994fc7c201276bd3d4d5d1744e13c4')
sha256sums=('ab31dcee61b4c813424f75472194adb9641f984ee582af31bb51654be532bdd0'
            '0dd0d945c227d156431f7c0ef011f93bc83b15e9c818ad14f3c2ee61d50d5274'
            '8d1fdeef3d228acba16240f3ea3cc37c78c2ea93c9a3754a199b99e398a7802f'
            '5d0bab0efe02ca56ec9597b54b073ce40eb5d2378ddda278e8256baa68912d79')
sha384sums=('d8c3e96484e3d061748b59b2e05f417e7f73cfd277aa32e7303ab04f933513fffa404ab2dc9a84fd6c1bbce5cf333dfe'
            'cf461d7c547f54039b6eecb937f5967cf47582566bc7f0c182a97b30cf94fe01a3422e49e83b4cfb177268ab0c1adfd9'
            '3f1734ad29d997efdf4ed55d0ffe9e3cbe4885f3e01dbbf13ea665b74e3250f209b824979fc6ca44fe5cc75bbb3db9fd'
            '20b235a2542a3e5113bc2240d120f451437d69fc2bd4b7811ba87cf361d9c0d215c3af27ac2ae1d26930e4670a457722')
sha512sums=('fce05041db55ae14adb490458c7fa91f53d0a3f0dd0ffec6dfd6ca778676fe3f5b1075aa6acd7b7a2e51264d52721b92249010a9e83f0d32e25507200ff1042e'
            '9f8aea4583a101981772d82965f80c2c27778bf905f651f960d8a24f2e671058473bd818fe764eb8f289f9c088d5b543693ff51b658dd9d7213bf300110f240e'
            '7f00eb766de989608a97d26e465d11da73b5c72e95896c5670956b0296b6c192d95a0eb44df5b02e2eeca31319f13039c1a202403a0d4d1396043c025421afc1'
            '1a1bb2c92a45e1f5cf1510da764faa5f5478163694a57904af6d8a25539933434e1fe85104bfcfe6a5a7ca00e5d1f60bc91e1f901ec63af0020baa66d1e04f68')
