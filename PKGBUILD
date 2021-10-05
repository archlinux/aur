# Maintainer: ZenTauro <zentauro at riseup dot net>

pkgname=conduit
pkgver=0.2.0
epoch=1
pkgrel=2
pkgdesc='A simple, fast and reliable chat server powered by matrix'
arch=(x86_64)
url='https://conduit.rs/'
license=(APACHE)
depends=(gcc-libs)
makedepends=(git rust)
backup=(etc/matrix-conduit/conduit.toml)
optdepends=()
source=(
  "git+https://gitlab.com/famedly/conduit.git#tag=v${pkgver}"
  "conduit.service"
  "conduit.sysusers"
  "conduit.tmpfiles"
  "conduit.toml"
)
sha512sums=(
  'SKIP'
  'b8a27daf08eac8c7b59682fe826fe965af402bf4eda21aef4ee59f12f9ed9eb0bcc8d37645d7be0a986b17580f53db075bdc3c4d12f9389f45b14fb46cbbbf98'
  'b20e4bad51c28ca268c7cf59406f09c1badb4e0688030e222d45a415822ac357a7e4674b3a1483935352f70d80da2c31004059f5acd7f0a522ace14539ad49f5'
  '3da5d584492e7b586c4722327cd2f23d4abf814f2067b068741998582ce870fec26fac83d96a2a9c42e060475be0abdde0207daf2be08678be4cee77d6b778b1'
  '5bd0813b0cbb1ed7e83a946ce9b5a321e057ccb2cce4ae4bebff21d4b87cac03fc424a771a959be64a12bd5da0a3a088f0dfb9a42028a4f3d5525d909e830431'
)

build() {
  cd "${srcdir}/conduit"
  cargo build --release
}

package() {
  install -Dm 755 "${srcdir}/conduit/target/release/conduit" "${pkgdir}/usr/bin/conduit-matrix"
  install -Dm 644 "${srcdir}/conduit.service"             -t "${pkgdir}/usr/lib/systemd/system/"
  install -Dm 644 "${srcdir}/conduit.sysusers"               "${pkgdir}/usr/lib/sysusers.d/conduit.conf"
  install -Dm 644 "${srcdir}/conduit.tmpfiles"               "${pkgdir}/usr/lib/tmpfiles.d/conduit.conf"
  install -Dm 644 "${srcdir}/conduit.toml"                   "${pkgdir}/etc/matrix-conduit/conduit.toml"
}

# vim: ts=2 sw=2 et
