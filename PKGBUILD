# Maintainer: Ulises Jeremias <ulisescf.24@gmail.com>
pkgname=veasel-code-bin
pkgver=0.20.0.next.0
pkgrel=1
pkgdesc="V-native AI coding agent (official prebuilt Linux release)"
arch=('x86_64')
url="https://veasel.dev"
license=('MIT')
depends=('bun' 'glibc')
provides=('veasel' 'veasel-code')
conflicts=('veasel-code')
options=('!debug' '!strip')
_tag="v${pkgver//.next./-next.}"
source=(
  "veasel-Linux.tar.gz::https://github.com/veasel-labs/veasel/releases/download/${_tag}/veasel-Linux.tar.gz"
  "LICENSE::https://raw.githubusercontent.com/veasel-labs/veasel/${_tag}/LICENSE"
)
noextract=('veasel-Linux.tar.gz')
sha256sums=(
  '428b0cff22c44830f48a612697a31ea4b0eb9e1a98593ce99c3f9d005ae695ea'
  'e150ff1e9cd21b388ec966f3d77ed4731e86e4731b17f127e879f72ff5b2e3d5'
)

package() {
  local bundle="${srcdir}/veasel-bundle"
  install -d "${bundle}"
  tar -xzf "${srcdir}/veasel-Linux.tar.gz" -C "${bundle}" veasel tui
  install -Dm755 "${bundle}/veasel" "${pkgdir}/usr/lib/veasel-code/veasel"
  cp -R "${bundle}/tui" "${pkgdir}/usr/lib/veasel-code/tui"
  rm -rf "${pkgdir}/usr/lib/veasel-code/tui/node_modules/@opentui/core-linux-x64-musl"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -d "${pkgdir}/usr/bin"
  ln -s /usr/lib/veasel-code/veasel "${pkgdir}/usr/bin/veasel"
}
