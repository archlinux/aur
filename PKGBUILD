# Maintainer: Rojikku <RojikkuNoKami at gmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=ssh-vault
pkgver=1.2.2
pkgrel=1
pkgdesc="Encrypt/Decrypt using SSH keys"
arch=('x86_64')
url='https://ssh-vault.com'
license=('BSD')
depends=('glibc')
makedepends=('rust' 'musl' 'git')
options=(!debug !lto)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ssh-vault/ssh-vault/archive/${pkgver}.tar.gz")
sha256sums=('040aaadb85fad375388b836157bd2615081607d58dbcfc51d1af1e922a2d29c4')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release --locked
}


package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 target/release/ssh-vault "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
