# Maintainer: Rojikku <RojikkuNoKami at gmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=ssh-vault
pkgver=1.3.6
pkgrel=1
pkgdesc="Encrypt/Decrypt using SSH keys"
arch=('x86_64')
url='https://ssh-vault.com'
license=('BSD')
depends=('glibc')
makedepends=('rust' 'musl' 'git')
options=(!debug !lto !buildflags)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ssh-vault/ssh-vault/archive/${pkgver}.tar.gz")
sha256sums=('5b948701b0ebe4ac72e12d898e7ce800eebd7ceca9a7748f73f3e680f3d95461')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release --locked
}


package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 target/release/ssh-vault "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
