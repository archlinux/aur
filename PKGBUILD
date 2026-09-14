# Maintainer: Seppia <$(base64 -d <<< 'YXJjaGxpbnV4QHNlcHBpYS5uZXQK')>

_reponame="lk-jwt-service"
pkgname="element-${_reponame}"
pkgver=0.7.0
pkgrel=1
pkgdesc='LiveKit Management Service for Element Call'
arch=(x86_64)
url='https://github.com/vector-im/lk-jwt-service/'
license=("AGPL-3")
makedepends=(rust git)
backup=(
	"etc/${_reponame}/env.conf"
)
source=(
	"https://github.com/element-hq/${_reponame}/archive/refs/tags/v${pkgver}.tar.gz"
	"${_reponame}.service"
	"env.conf"
)
sha512sums=(
	'0eba301b3cb70b22796725623e69e47c95e2271922804128f3786c84c7ff01c08deebf26a383b9c64f63f9a9be3a39afa70fe5b1b1692f10986fedbdd28e778e'
	'48fdad2ad2eb41fbba132cf7a8f2abe9ade07cc0d4d9a80c9a8f9180d7810dd46c41b34d889b4194756cbea15bd8d1875aa611bac4ee0cf993dcbf9079f02290'
	'f85f83b54db9c6b2c8d237b7965729e686c2f1e360e0ca852de4cface25b59d4424be9b4226e23bda589bf1abb724204499f1077c2702a765d9ead8fb3e7665e'
)

prepare() {
  cd ${_reponame}-${pkgver}
}

build() {
  cd ${_reponame}-${pkgver}
  cargo build --release
}

package() {
  install -vDm755 ${_reponame}-${pkgver}/target/release/lk-jwt-service -t "$pkgdir/usr/bin"
  install -vDm644 ${_reponame}.service -t "$pkgdir/usr/lib/systemd/system/"
  install -vDm644 env.conf -t "$pkgdir/etc/lk-jwt-service/"
}
