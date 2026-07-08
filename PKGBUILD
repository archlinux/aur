pkgname=slskr-bin
pkgver=0.2.26
pkgrel=1
pkgdesc='Rust Soulseek daemon with bundled Web UI'
arch=('x86_64')
url='https://github.com/snapetech/slskr'
license=('AGPL-3.0-only')
depends=('gcc-libs' 'glibc')
provides=('slskr')
conflicts=('slskr')
backup=('etc/slskr/config.toml')
source=(
  "slskr-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/snapetech/slskr/releases/download/release-v${pkgver}/slskr-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz"
  'slskr.service'
  'slskr.sysusers'
  'slskr.tmpfiles'
  'slskr.install'
)
sha256sums=('c226fc98b95e930f42e54af32821d53453f8df6b32d0fb8d2498463ff53e6d5d' '3553ccff12888654c51848ae84c2ffec6fd35171a41ecfc4e7985553a59a90c9' '384dc783fd133eadcee6d9575eb41209fd231bd0728b815a5cf4af2ff6c43629' 'efbe26e7b0765a17276981f4694d30d3174cba6799588e7ae6590acdd1fe73d9' 'befeeb12e6ca2ca61d2b20a94c834e71e7f9c79dc38b236fb9bf5f0494f694bf')
install=slskr.install

package() {
  local root="${srcdir}/slskr-v${pkgver}-x86_64-unknown-linux-gnu"
  install -Dm755 "${root}/slskr" "${pkgdir}/usr/bin/slskr"
  install -Dm644 "${root}/docs/slskr.config.example.toml" "${pkgdir}/etc/slskr/config.toml"
  install -Dm644 "${srcdir}/slskr.service" "${pkgdir}/usr/lib/systemd/system/slskr.service"
  install -Dm644 "${srcdir}/slskr.sysusers" "${pkgdir}/usr/lib/sysusers.d/slskr.conf"
  install -Dm644 "${srcdir}/slskr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/slskr.conf"
  install -Dm644 "${root}/README.md" "${pkgdir}/usr/share/doc/slskr/README.md"
  install -Dm644 "${root}/LICENSE" "${pkgdir}/usr/share/licenses/slskr/LICENSE"
  mkdir -p "${pkgdir}/usr/share/slskr/web"
  cp -R "${root}/web/build" "${pkgdir}/usr/share/slskr/web/build"
}
